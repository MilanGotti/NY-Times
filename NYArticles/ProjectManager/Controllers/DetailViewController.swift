//
//  DetailViewController.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var buttonClose: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: Declarations
    var urlString = ""
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      
      UIView.animate(withDuration: 0.2) {
        self.buttonClose.alpha = 0
      }
    }
    
    override var prefersStatusBarHidden: Bool {
      return true
    }
    
    //MARK: Button Actions
    @objc func buttonCloseClick(_ sender: UIButton){
        dismiss(animated: true)
    }
    
    //MARK: Other Methods
    
    func setupView() {
        
        
        self.buttonClose.addTarget(self, action: #selector(buttonCloseClick), for: .touchUpInside)
        
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
