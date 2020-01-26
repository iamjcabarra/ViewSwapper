//
//  PrimaryViewController.swift
//  ViewSwapper
//
//  Created by Julius Camba Abarra on 10/17/19.
//  Copyright © 2019 iamjcabarra. All rights reserved.
// 

import UIKit

public final class PrimaryViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
   
    // MARK: - Stored Properties
    private var swapper: PrimaryViewSwapper!
    private var passedCountryList: [Country] = [Country]()
    private var countryList: [Country] = [Country]()

    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assemble country list
        self.configureDataSource()
        
        // Configure target action for segmentedControl
        self.segmentedControl.addTarget(
            self,
            action: #selector(PrimaryViewController.didToggleSegmentControl(_:)),
            for: UIControl.Event.valueChanged
        )
        
        // Show countr list view by default
        self.showView(withSegueIdentifier: Constant.SegueIdentifier.countries)
    }

}

// MARK: - Utility Methods
extension PrimaryViewController {
   
    private func configureDataSource() {
        self.countryList = [
            Country(name: "Japan", isFavourite: false),
            Country(name: "Singapore", isFavourite: false),
            Country(name: "Malaysia", isFavourite: false),
            Country(name: "Qatar", isFavourite: false),
            Country(name: "Philippines", isFavourite: false),
            Country(name: "India", isFavourite: false),
            Country(name: "Australia", isFavourite: false),
            Country(name: "Zimbabwe", isFavourite: false),
            Country(name: "Canada", isFavourite: false),
            Country(name: "Jamaica", isFavourite: false),
        ]
        
        self.passedCountryList = self.countryList
    }
    
    private func showView(
        withSegueIdentifier identifier: String
    ) {
        DispatchQueue.main.async(execute: {
            self.swapper.swapToViewController(
                withSegueIdentifier: identifier,
                countryList: self.passedCountryList
            )
        })
    }
    
}

// MARK: - Target Action Methods
extension PrimaryViewController {
    
    @objc private func didToggleSegmentControl(
        _ sender: UISegmentedControl
    ) {
        guard
            let segment = Segment(rawValue: sender.selectedSegmentIndex)
        else {
            print("Error: Segment is nil!")
            return
        }
        
        var identifier = ""
        
        switch segment {
        case .countries:
            self.passedCountryList = self.countryList
            identifier = Constant.SegueIdentifier.countries
        case .favorites:
            self.passedCountryList = self.countryList.filter { $0.isFavourite == true }
            identifier = Constant.SegueIdentifier.favorites
        }
        
        self.showView(withSegueIdentifier: identifier)
    }
    
}

// MARK: - Navigation
extension PrimaryViewController {
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.SegueIdentifier.swapper {
            self.swapper = segue.destination as? PrimaryViewSwapper
        }
    }
    
}

