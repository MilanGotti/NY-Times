//
//  DetailViewController.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit
import WebKit

class DetailViewController: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var labelDetail: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: Declarations
    var urlString = ""
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    //MARK: Button Actions
    @objc func buttonBackClick(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Other Methods
    
    func setupView() {
        
        self.labelDetail.setupLabel(title: "Details", font: AppFont.size18.bold, color: .appWhite)
        self.viewNavigation.backgroundColor = .appBlue
        self.buttonBack.addTarget(self, action: #selector(buttonBackClick), for: .touchUpInside)
        
        let url = URL(string: self.urlString)
        let request = URLRequest(url: url!)
        webView.navigationDelegate = self
        webView.load(request)
    }
    
    
}


extension DetailViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        appLoaderView.startAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        appLoaderView.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.showAlertMessage(title: SuccessStatus.error.rawValue, message: error.localizedDescription)
    }
    
}
