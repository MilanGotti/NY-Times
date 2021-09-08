//
//  UIString+Extension.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation

extension String {
    func convertDateString(fromFormat sourceFormat : String, toFormat desFormat : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = sourceFormat
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = desFormat
        return dateFormatter.string(from: date!)
    }
}
