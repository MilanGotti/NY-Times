//
//  BaseViewController.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit

class BaseViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        statusBarStyle = .lightContent
        self.setNeedsStatusBarAppearanceUpdate()
        
        appLoaderView.backgroundColor = UIColor.appBlack.withAlphaComponent(0.1)
        appKeyWindow?.addSubview(appLoaderView)
        
        if #available(iOS 13.0, *) {
            let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
            let statusBarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: statusBarHeight))
            statusBarView.backgroundColor = .appBlue
            view.addSubview(statusBarView)
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .appBlue
        }
    }
    

}
