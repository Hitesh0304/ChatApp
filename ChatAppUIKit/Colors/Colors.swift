//
//  Colors.swift
//  ChatAppUIKit
//
//  Created by Hitesh Moudgil on 2023-11-06.
//

import UIKit

public enum Colors: String {
    case background
    case secondaryBackground
    case text
    case primary
    case white
    
    public var color: UIColor {
        return UIColor(named: rawValue)!
    }
}
