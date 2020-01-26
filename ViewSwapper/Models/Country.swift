//
//  Country.swift
//  ViewSwapper
//
//  Created by Julius Camba Abarra on 10/17/19.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import Foundation

public final class Country {
    
    // MARK: - Stored Properties
    public var name: String
    public var isFavourite: Bool
    
    // MARK: - Initializer
    public init(name: String, isFavourite: Bool) {
        self.name = name
        self.isFavourite = isFavourite
    }
    
}
