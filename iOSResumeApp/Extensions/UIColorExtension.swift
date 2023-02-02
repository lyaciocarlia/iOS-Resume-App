//
//  UIColorExtension.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 25.01.2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static let lightColor = UIColor(rgb: 0xFAF6F4)
    
    static let darkColor = UIColor(rgb: 0x170312)
    
    static let darkPurple = UIColor(rgb: 0x8136D8)
    
    static let lightPurple =  UIColor(rgb: 0x7E7AE2)
    
    static let fucsia = UIColor(rgb: 0xFE4660)
    
    static let pink = UIColor(rgb: 0xF07A8A)
    
    static let highlighted = UIColor(rgb: 0xBBBBC1) 
    
}
