//
//  HomeViewController.swift
//  NYArticles
//
//  Created by DREAMWORLD on 09/09/21.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK: Outlets
    
    
    //MARK: Declarations
    var viewModel = HomeArticlesViewModel()
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getArticles()
    }
    
    //MARK: API Calls
    func getArticles() {
        appLoaderView.startAnimating()
        self.viewModel.getHomeArticles(type: "") { (result, error) in
            appLoaderView.stopAnimating()
            if result {
                print("Success")
            } else {
                self.showAlertMessage(title: SuccessStatus.error.rawValue, message: error)
            }
        }
    }
    
    //MARK: Button Actions
    
    
    //MARK: Other Methods
    
    
}
