//
//  NavigationView.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit

protocol NavigationViewDelegate {
    func dismiss()
}

class NavigationView: UIView {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelTitleLeading: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var buttonBackWidth: NSLayoutConstraint!
    @IBOutlet weak var searchViewLeading: NSLayoutConstraint!
    @IBOutlet weak var searchViewWidth: NSLayoutConstraint!
    @IBOutlet weak var searchButton: UIButton!
    
    var delegate: NavigationViewDelegate?
    
    var placeHolderText: String = "" {
        didSet {
            self.setupUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        
        let view =  UINib(nibName: "NavigationView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        
        self.addSubview(view)
        self.searchView.setCorner(color: UIColor.appWhite.withAlphaComponent(0.1))
        self.labelTitle.setupLabel(font: AppFont.size18.bold, color: .appWhite)
        self.hideTextField()
        self.textField.setPlaceholder(text: "Search by names", color: .appWhite.withAlphaComponent(0.5), font: AppFont.size15.regular)
        self.textField.setupField(font: AppFont.size15.regular, color: .appWhite)
        
        self.searchButton.addTarget(self, action: #selector(searchButtonClick), for: .touchUpInside)
        self.textField.addTarget(self, action: #selector(endEditingAction), for: .editingDidEnd)
        self.buttonClose.addTarget(self, action: #selector(buttonBackClick), for: .touchUpInside)
    }
    
    private func setupUI() {
        self.textField.setPlaceholder(text: self.placeHolderText, color: .appGray, font: AppFont.size15.regular)
    }
    
    private func hideTextField() {
        self.delegate?.dismiss()
        self.labelTitle.text = appStrings.NYPopular
        self.searchView.backgroundColor = .clear
        self.labelTitleLeading.constant = 20
        self.searchViewWidth.constant = 36
        self.buttonClose.isHidden = true
        self.buttonBackWidth.constant = 0
        self.searchViewLeading.constant = 20
    }
    
    private func showTextField(){
        self.labelTitle.text = ""
        self.labelTitleLeading.constant = 10
        self.searchView.backgroundColor = UIColor.appWhite.withAlphaComponent(0.15)
        self.searchViewWidth.constant = SCREEN_Width - 20
        self.buttonClose.isHidden = false
        self.buttonBackWidth.constant = 36
        self.searchViewLeading.constant = 0
    }
    
    @objc func searchButtonClick(_ sender: UIButton){
        self.showTextField()
        self.animateView()
    }
    
    @objc func endEditingAction(_ sender: UITextField){
        self.hideTextField()
        self.animateView()
    }
    
    @objc func buttonBackClick(_ sender: UIButton){
        self.hideTextField()
        self.animateView()
        self.textField.text = ""
        self.textField.endEditing(true)
    }
    

    func animateView() {
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    
}
