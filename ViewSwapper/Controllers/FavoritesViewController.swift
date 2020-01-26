//
//  FavoritesViewController.swift
//  ViewSwapper
//
//  Created by Julius Camba Abarra on 10/17/19.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import UIKit

public final class FavoritesViewController: UIViewController {
    
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
extension FavoritesViewController: UITableViewDataSource {
    
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
                withIdentifier: Constant.CellIdentifier.favorite
                ) as? FavoriteTableViewCell
            else {
                return UITableViewCell()
        }
        
        let country: Country = self.countryList[indexPath.row]
        cell.nameLabel.text = country.name
        return cell
    }
    
}
