//
//  UIColor+Extension.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import UIKit

extension UIColor {
    
    static let appBlue = UIColor(RGB: 0x05386b)
    static let appGreen = UIColor(RGB: 0x5CDB95)
    static let appWhite = UIColor(RGB: 0xFFFFFF)
    static let appBlack = UIColor(RGB: 0x000000)
    static let appGray = UIColor(RGB: 0x4E4E50)
    static let appLightGray = UIColor(RGB: 0xAAABBB)
    
    
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(RGB: Int) {
       self.init(
           red: (RGB >> 16) & 0xFF,
           green: (RGB >> 8) & 0xFF,
           blue: RGB & 0xFF
       )
   }
    
}
