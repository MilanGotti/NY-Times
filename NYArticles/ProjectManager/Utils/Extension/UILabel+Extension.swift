//
//  UILabel+Extension.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import UIKit

extension UILabel {
    func setupLabel(font: UIFont = AppFont.size17.regular, color: UIColor = .gray){
        self.textColor = color
        self.font = font
    }
    
    func setupLabel(title: String ,font: UIFont = AppFont.size17.regular, color: UIColor = .gray){
        self.text = title
        self.textColor = color
        self.font = font
    }
}
