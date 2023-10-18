//
//  Fonts.swift
//  ChatAppUIKit
//
//  Created by Hitesh Moudgil on 2023-10-17.
//

import Foundation
import UIKit

public struct Fonts {
    public enum Weight {
        case regular
        case semibold
        case bold
        
        public var name: String {
            switch self {
            case .regular:
                "ProximaNova-Regular"
            case .semibold:
                "ProximaNova-Semibold"
            case .bold:
                "ProximaNova-Bold"
            }
        }
    }
    
    public enum Size: CGFloat {
        case title = 34
        case title1 = 28
        case title2 = 22
        case title3 = 20
        case headline = 17
        case callout = 16
        case subheadline = 15
        case footnote = 13
        case caption = 12
    }
    
    public static func apply(_ size: Size, _ weight: Weight) -> UIFont {
        return UIFont(name: weight.name, size: size.rawValue)!
    }
    
    public static func custom(_ size: CGFloat, _ weight: Weight) -> UIFont {
        return UIFont(name: weight.name, size: size)!
    }
}
