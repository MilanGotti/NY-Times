//
//  HomeViewController.swift
//  NYArticles
//
//  Created by DREAMWORLD on 09/09/21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK: Outlets
    @IBOutlet weak var navigationBar: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Declarations
    var viewModel = HomeArticlesViewModel()
    let transition = PopAnimator()
    
    //MARK: View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
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
                self.tableView.reloadData()
            } else {
                self.showAlertMessage(title: SuccessStatus.error.rawValue, message: error)
            }
        }
    }
    
    //MARK: Button Actions
    
    
    //MARK: Other Methods
    func setupView() {
        self.transition.dismissCompletion = { [weak self] in
            guard
                let selectedIndexPathCell = self?.tableView.indexPathForSelectedRow,
                let _ = self?.tableView.cellForRow(at: selectedIndexPathCell) as? HomeTableViewCell
            else {
                return
            }
            self?.tableView.reloadRows(at: [selectedIndexPathCell], with: .fade)
        }
        
        self.navigationBar.backgroundColor = .appBlue
        self.titleLabel.setupLabel(font: AppFont.size18.bold, color: .appWhite)
        
        self.tableView.register(UINib(nibName: appIdentifiers.HomeTableViewCell.string, bundle: nil), forCellReuseIdentifier: appIdentifiers.HomeTableViewCell.string)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.articlesListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: appIdentifiers.HomeTableViewCell.string, for: indexPath) as! HomeTableViewCell
        cell.articles = self.viewModel.articlesListArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_Width 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self.viewModel.articlesListArray[indexPath.row])
    }
    
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let detailsViewController = segue.destination as? DetailViewController,
            let storiesResults = sender as? TopStoriesResults {
            detailsViewController.transitioningDelegate = self
            detailsViewController.urlString = storiesResults.url ?? ""
        }
    }
}


// MARK: - UIViewControllerTransitioningDelegate

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard
            let selectedIndexPathCell = tableView.indexPathForSelectedRow,
            let selectedCell = tableView.cellForRow(at: selectedIndexPathCell) as? HomeTableViewCell,
            let selectedCellSuperview = selectedCell.superview
        else {
            return nil
        }
        
        self.transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
        self.transition.originFrame = CGRect(
            x: self.transition.originFrame.origin.x + 20,
            y: self.transition.originFrame.origin.y + 20,
            width: self.transition.originFrame.size.width - 40,
            height: self.transition.originFrame.size.height - 40
        )
        
        self.transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transition.presenting = false
        return self.transition
    }
}
