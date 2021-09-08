//
//  FontConstant.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import UIKit

func systemFontOfSize(size: CGFloat) -> CGFloat {
    
    if iPhone_5 {
        return size - 3
    } else if iPhone_8_X_XS_11Pro_12Mini {
        return size - 1.5
    } else if iPhone_12_12Pro {
        return size
    } else if iPhone_8Plus_XR_XSMax_11_11ProMax {
        return size + 1.5
    } else if iPhone_12ProMax {
        return size + 2.5
    } else { //iPad
        return size + 3.5
    }
    
}


enum AppFont : CGFloat  {
    
    case size8 = 8
    case size9 = 9
    case size10 = 10
    case size11 = 11
    case size12 = 12
    case size13 = 13
    case size14 = 14
    case size15 = 15
    case size16 = 16
    case size17 = 17
    case size18 = 18
    case size19 = 19
    case size20 = 20
    case size21 = 21
    case size22 = 22
    case size23 = 23
    case size24 = 24
    case size25 = 25
    case size26 = 26
    case size27 = 27
    case size28 = 28
    case size29 = 29
    case size30 = 30
    case size31 = 31
    case size32 = 32
    case size33 = 33
    case size34 = 34
    case size35 = 35
    case size36 = 36
    case size50 = 50
    
    var light: UIFont {
        return UIFont(name: FontNames.Poppins_Light, size: systemFontOfSize(size: self.rawValue))!
    }
    
    var regular: UIFont {
        return UIFont(name: FontNames.Poppins_Regular, size: systemFontOfSize(size: self.rawValue))!
    }
    
    var medium: UIFont {
        return UIFont(name: FontNames.Poppins_Medium, size: systemFontOfSize(size: self.rawValue))!
    }
    
    var semibold: UIFont {
        return UIFont(name: FontNames.Poppins_SemiBold, size: systemFontOfSize(size: self.rawValue))!
    }
    
    var bold: UIFont {
        return UIFont(name: FontNames.Poppins_Bold, size: systemFontOfSize(size: self.rawValue))!
    }
    
}
