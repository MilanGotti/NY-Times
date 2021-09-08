//
//  UITextField+Extension.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import UIKit


extension UITextField {
    
    func setPlaceholder(text: String, color: UIColor = .gray, font: UIFont = AppFont.size17.regular) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: font])
    }
    
    func setupField(font: UIFont = AppFont.size17.regular, color: UIColor = .gray) {
        self.font = font
        self.textColor = color
    }
    
}
