//
//  CountriesViewController.swift
//  ViewSwapper
//
//  Created by Julius Camba Abarra on 10/17/19.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import UIKit

public final class CountriesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Stored Properties
    public var countryList: [Country] = [Country]()

    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource Methods
extension CountriesViewController: UITableViewDataSource {
    
    public func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return 1
    }
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return self.countryList.count
    }
    
    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.CellIdentifier.country
            ) as? CountryTableViewCell
        else {
            return UITableViewCell()
        }
        
        let country: Country = self.countryList[indexPath.row]
        cell.nameLabel.text = country.name
        cell.heartButton.setImage(
            country.isFavourite ? #imageLiteral(resourceName: "RedHeart") : #imageLiteral(resourceName: "BlackHeart"),
            for: UIControl.State.normal
        )
        cell.delegate = self
        return cell
    }
    
}

// MARK: - CountryTableViewCellDelegate Methods
extension CountriesViewController: CountryTableViewCellDelegate {
    
    public func didTapHeartButton(fromCell cell: CountryTableViewCell) {
        guard let indexPath = self.tableView.indexPath(for: cell) else {
            print("Error: Can't capture index path from cell!")
            return
        }
        let country: Country = self.countryList[indexPath.row]
        country.isFavourite = !country.isFavourite
        cell.heartButton.setImage(
            country.isFavourite ? #imageLiteral(resourceName: "RedHeart") : #imageLiteral(resourceName: "BlackHeart"),
            for: UIControl.State.normal
        )
    }
    
}

