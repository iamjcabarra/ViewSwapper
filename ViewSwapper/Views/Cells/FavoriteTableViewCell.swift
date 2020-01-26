//
//  FavoriteTableViewCell.swift
//  ViewSwapper
//
//  Created by Julius Camba Abarra on 10/17/19.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import UIKit

public final class FavoriteTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!

    // MARK: - Overrides
    public override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
