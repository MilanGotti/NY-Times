//
//  UIView+Extension.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import UIKit

extension UIView {
    
    func setCorner(color: UIColor = .appLightGray ,size: CGFloat = 8, addShadow: Bool = false){
        self.backgroundColor = color
        
        self.layer.cornerRadius = size
        self.clipsToBounds = true
        
        if addShadow {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOpacity = 0.7
            layer.shadowOffset = CGSize(width: 2, height: 2)
            layer.shadowRadius = 1
        }
        
    }
    
}
