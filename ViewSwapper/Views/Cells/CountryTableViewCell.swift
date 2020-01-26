//
//  CountryTableViewCell.swift
//  ViewSwapper
//
//  Created by Julius Camba Abarra on 10/17/19.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import UIKit

// MARK: - Protocol
public protocol CountryTableViewCellDelegate: class {
    func didTapHeartButton(fromCell cell: CountryTableViewCell)
}

public final class CountryTableViewCell: UITableViewCell {
    
    // MARK: - Delegate
    public weak var delegate: CountryTableViewCellDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!

    // MARK: - Overrides
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        self.heartButton.addTarget(
            self,
            action: #selector(CountryTableViewCell.didTapHeartButton(_:)),
            for: UIControl.Event.touchUpInside
        )
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: - Target Action Methods
extension CountryTableViewCell {
    
    @objc private func didTapHeartButton(_ sender: UIButton) {
        guard let delegate = self.delegate else {
            print("Error: Delegate is nil!")
            return
        }
        delegate.didTapHeartButton(fromCell: self)
    }

}
