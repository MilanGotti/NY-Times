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
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: Declarations
    var viewModel = MostViewedArticlesModel()
    let headerId = "headerId"
    let categoryHeaderId = "categoryHeaderId"
    
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
        self.viewModel.getMostViewed { result, error in
            appLoaderView.stopAnimating()
            if result {
                self.collectionView.reloadData()
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
        
        collectionView.register(ArticleTypesCell.self, forCellWithReuseIdentifier: ArticleTypesCell.reuseIdentifer)
        collectionView.register(ArticleHeaderView.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
    }
    
    
    //MARK: - Helper Method
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            return self.firstLayoutSection()
        }
    }
    
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets.bottom = 15
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalWidth(0.5))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 2)
       
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 15
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [
            NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44)), elementKind: categoryHeaderId, alignment: .top)
        ]
        
        return section
    }
    
    
}


extension TopViewdViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.viewedArticles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.viewedArticles[section].articlesResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArticleTypesCell.reuseIdentifer, for: indexPath) as! ArticleTypesCell
        
        if let url = self.viewModel.viewedArticles[indexPath.section].articlesResults?[indexPath.row].media?.first?.mediaMetadata?.last?.url {
            cell.configure(withImageName: url)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ArticleHeaderView
        
        header.label.text = self.viewModel.viewedArticles[indexPath.section].type ?? ""
        
        return header
    }
}
