//
//  AppConstant.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import UIKit

//MARK:- Screen size
let SCREEN_BOUND = UIScreen.main.bounds
let SCREEN_Width = SCREEN_BOUND.width
let SCREEN_Height = SCREEN_BOUND.height

let iPhone_5 = SCREEN_Width == 320
let iPhone_8_X_XS_11Pro_12Mini = SCREEN_Width == 375
let iPhone_12_12Pro = SCREEN_Width == 390
let iPhone_8Plus_XR_XSMax_11_11ProMax = SCREEN_Width == 414
let iPhone_12ProMax = SCREEN_Width == 428

//MARK:- NVActivity Indicator
let appLoaderView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: SCREEN_Width, height: SCREEN_Height), color: .appBlue, padding: SCREEN_Width / 1.77)


let serverDateFormate = "yyyy-MM-dd"
let appDateFormate = "MMM d, yyyy"
//MARK:- PlacehoderImage
let trackPlaceHolderImage = UIImage()
let placeHolderLogo = #imageLiteral(resourceName: "placeHolder_image")


//MARK:- Key Window
var appKeyWindow : UIWindow? {
    if #available(iOS 13, *) {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    } else {
        return UIApplication.shared.keyWindow
    }
}//= UIApplication.shared.windows.first(where: { $0.isKeyWindow })

var topPadding: CGFloat {
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows[0]
        return window.safeAreaInsets.top
    } else {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.top ?? 20
    }
}

var bottomPadding: CGFloat {
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows[0]
        return window.safeAreaInsets.bottom
    } else {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets.bottom ?? 0
    }
}

var statusBarStyle : UIStatusBarStyle = .default

struct FontNames {
    static let Poppins_Regular = "Poppins-Regular"
    static let Poppins_SemiBold = "Poppins-SemiBold"
    static let Poppins_Medium = "Poppins-Medium"
    static let Poppins_Light = "Poppins-Light"
    static let Poppins_Bold = "Poppins-Bold"
}
