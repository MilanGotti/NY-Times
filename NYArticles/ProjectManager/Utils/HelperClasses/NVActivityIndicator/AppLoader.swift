//
//  AppLoader.swift
//  AudiciNew
//
//  Created by iMac on 19/07/21.
//

import Foundation
import UIKit

class AppLabelLoader: UIView {
    
   static let shared = AppLabelLoader()
    
    var view = UIView()
    
    //MARK: Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Add custom code here
        self.commonInit()
    }
    
    required init?(coder aDecorder: NSCoder) {
        super.init(coder: aDecorder)
        // Add custom code here
        self.commonInit()
    }
    
    //MARK: Custom Methods
    func commonInit() {
        self.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view.backgroundColor = UIColor.appBlack.withAlphaComponent(0.2)
        addSubview(view)
    }
    
    
    func show(title : String) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        let label = UILabel()
        label.tag = 103
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .appWhite
        label.text = title
        label.font = AppFont.size15.regular
        
        label.frame = CGRect(x: self.frame.minX , y: self.center.y + 12 , width: self.frame.size.width, height: 100)
            
        self.view.addSubview(appLoaderView)
        self.view.addSubview(label)
        self.view.bringSubviewToFront(label)
        self.view.layoutIfNeeded()
        
        appLoaderView.startAnimating()
        appKeyWindow?.addSubview(self)
    }
    
    func hide() {
        
        DispatchQueue.main.async {
            UIApplication.shared.endIgnoringInteractionEvents()
            appLoaderView.stopAnimating()
            self.view.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
    
    
}
