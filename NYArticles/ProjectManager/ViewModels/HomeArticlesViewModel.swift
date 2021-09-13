//
//  HomeArticlesViewModel.swift
//  NYArticles
//
//  Created by DREAMWORLD on 10/09/21.
//

import Foundation

class HomeArticlesViewModel {
    
     
    var articlesListArray = [TopStoriesResults]()
    
    //MARK: Fetch Articles list
    func getHomeArticles(type: String, completion:@escaping(Bool, String)->Void) {
        
        guard Reachability.isConnectedToNetwork() else {
            completion(false, errorMessage.noInternet.rawValue)
            return
        }
        
        APIManager.shared.homeArticals() { (response) in
            switch response {
            case .failure(let error):
                completion(false, error.localizedDescription)
            case .success(let response) :
                self.articlesListArray = response.topStoriesResults ?? [TopStoriesResults]()
                completion(true, "")
            }
        }
    }
    
}
