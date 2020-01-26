//
//  PrimaryViewSwapper.swift
//  ViewSwapper
//
//  Created by Julius Abarra on 18/10/2019.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import UIKit

public final class PrimaryViewSwapper: UIViewController {
    
    // MARK: - Segmented View Controllers
    private var countriesVC: CountriesViewController!
    private var favoritesVC: FavoritesViewController!

    // MARK: - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Public APIs
extension PrimaryViewSwapper {
    
    /// Navigates to the view controller with the given segue
    /// identifier.
    ///
    /// - parameter identifier: Controller's segue identifier
    public func swapToViewController(
        withSegueIdentifier identifier: String,
        countryList: [Country]
        ) {
        let data: [String: Any] = ["countryList": countryList]
        self.performSegue(
            withIdentifier: identifier,
            sender: data
        )
    }
    
    /// Transitions from one view controller to another view
    /// controller with an animation.
    ///
    /// - parameters:
    ///     - fvc: A source `UIViewController`
    ///     - tvc: A destination `UIViewController`
    public func swap(
        fromViewController fvc: UIViewController,
        toViewController tvc: UIViewController
        ) {
        tvc.view.frame = CGRect(
            x: 0,
            y: 0, width: view.frame.size.width,
            height: view.frame.size.height
        )
        fvc.willMove(toParent: nil)
        self.addChild(tvc)
        
        self.transition(
            from: fvc,
            to: tvc,
            duration: 0.2,
            options: UIView.AnimationOptions.transitionCrossDissolve,
            animations: nil,
            completion: { finished in
                fvc.removeFromParent()
                tvc.didMove(toParent: self)
        })
    }
    
}

// MARK: - Navigation
extension PrimaryViewSwapper {
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var svcExists = false
        
        guard
            let data = sender as? [String: Any],
            let countryList = data["countryList"] as? [Country]
        else {
            print("ERROR: Can't parse segue sender's data!")
            return
        }
        
        if segue.identifier == Constant.SegueIdentifier.countries {
            self.countriesVC = segue.destination as? CountriesViewController
            self.countriesVC.countryList = countryList
            svcExists = true
        }
        
        if segue.identifier == Constant.SegueIdentifier.favorites {
            self.favoritesVC = segue.destination as? FavoritesViewController
            self.favoritesVC.countryList = countryList
            svcExists = true
        }
        
        if svcExists {
            if self.children.count > 0 {
                self.swap(
                    fromViewController: children[0],
                    toViewController: segue.destination
                )
            }
            else {
                self.addChild(segue.destination)
                segue.destination.view.frame = CGRect(
                    x: 0,
                    y: 0,
                    width: view.frame.size.width,
                    height: view.frame.size.height)
                self.view.addSubview(segue.destination.view)
                segue.destination.didMove(toParent: self)
            }
        }
        else {
            print("ERROR: Embedded view controller does not exist!")
        }
    }
    
}

