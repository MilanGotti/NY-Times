//
//  MostViewedArticlesModel.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit

class MostViewedArticlesModel {
    //MARK: Variables
    var articlesListArray = [ArticlesResults]()
    var filterArticlesList = [ArticlesResults]()
    var isSearching = false
    
    //MARK: Fetch Todo list
    func getMostViewed(completion:@escaping(Bool, String)->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            completion(false, errorMessage.noInternet.rawValue)
            return
        }
        
        APIManager.shared.mostViewed(finalResult: { response in
            switch response {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let response) :
                self.articlesListArray = response.articlesResults ?? [ArticlesResults]()
                completion(true, "")
            }
        })
    }
    
    
    func searchArticles(text: String){
        self.isSearching = true
        self.filterArticlesList = self.articlesListArray.filter { (service: ArticlesResults) -> Bool in
            if let name = service.title {
                return name.lowercased().contains(text.lowercased())
            } else {
                return false
            }
        }
    }
    
    
    
}
