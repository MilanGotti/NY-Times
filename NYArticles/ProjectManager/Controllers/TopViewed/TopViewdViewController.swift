//
//  TopViewdViewController.swift
//  NYArticles
//
//  Created by DREAMWORLD on 10/09/21.
//

import UIKit

class TopViewdViewController: BaseViewController {

    //MARK: Outlets
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Declarations
    var viewModel = MostViewedArticlesModel()
    
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
        self.viewModel.getMostViewed { result, error in
            appLoaderView.stopAnimating()
            if result {
                self.tableView.reloadData()
            } else {
                self.showAlertMessage(title: SuccessStatus.error.rawValue, message: error)
            }
        }
    }
    
    //MARK: Button Actions
    
    
    //MARK: Other Methods
    func setupView() {
        self.navigationBar.backgroundColor = .appBlue
        self.titleLabel.setupLabel(font: AppFont.size18.bold, color: .appWhite)
        
        /*self.tableView.register(UINib(nibName: appIdentifiers.HomeTableViewCell.string, bundle: nil), forCellReuseIdentifier: appIdentifiers.HomeTableViewCell.string)
        self.tableView.delegate = self
        self.tableView.dataSource = self*/
    }
    
}


