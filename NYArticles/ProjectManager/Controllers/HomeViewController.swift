//
//  HomeViewController.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit

class HomeViewController: BaseViewController {

    
    //MARK: Outlets
    @IBOutlet weak var navigationBar: NavigationView!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Declarations
    var viewModel = MostViewedArticlesModel()
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupTable()
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
        self.navigationBar.textField.delegate = self
        self.navigationBar.delegate = self
    }
    
    func setupTable() {
        self.tableView.register(UINib(nibName: appIdentifiers.MostViewedArticlesCell.rawValue, bundle: nil), forCellReuseIdentifier: appIdentifiers.MostViewedArticlesCell.rawValue)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel.isSearching ? self.viewModel.filterArticlesList.count : self.viewModel.articlesListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: appIdentifiers.MostViewedArticlesCell.rawValue, for: indexPath) as! MostViewedArticlesCell
        
        cell.articles = self.viewModel.articlesListArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        controller.urlString = self.viewModel.articlesListArray[indexPath.row].url ?? ""
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}


extension HomeViewController: UITextFieldDelegate, NavigationViewDelegate {
    
    func dismiss() {
        self.viewModel.isSearching = false
        self.tableView.reloadData()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let string = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        self.viewModel.searchArticles(text: string)
        self.viewModel.isSearching = !string.isEmpty
        self.tableView.reloadData()

        return true
    }
    
}
