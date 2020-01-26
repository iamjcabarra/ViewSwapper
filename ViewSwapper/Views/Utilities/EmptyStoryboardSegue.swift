//
//  EmptyStoryboardSegue.swift
//  ViewSwapper
//
//  Created by Julius Abarra on 18/10/2019.
//  Copyright © 2019 iamjcabarra. All rights reserved.
//

import UIKit

public final class EmptyStoryboardSegue: UIStoryboardSegue {
    
    /// Performs nothing. This will just allow transition
    /// manager to make custom view navigation.
    public override func perform() { }
    
}
