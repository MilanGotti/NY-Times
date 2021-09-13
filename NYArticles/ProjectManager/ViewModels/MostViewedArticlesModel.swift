//
//  MostViewedArticlesModel.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import UIKit

class MostViewedArticlesModel {
    //MARK: Variables
    
    var viewedArticles = [MostViewedList]()
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
                let articlesTypes = response.articlesResults?.map({ $0.section ?? "" }).uniqued()
                for type in articlesTypes ?? [String]() {
                    let articleList = response.articlesResults?.filter({ $0.section == type })
                    let viewedArticle = MostViewedList()
                    viewedArticle.type = type == "U.S." ? "us" : type
                    viewedArticle.articlesResults = articleList
                    self.viewedArticles.append(viewedArticle)
                }
                //self.articlesListArray = response.articlesResults ?? [ArticlesResults]()
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

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}


class MostViewedList: Codable {

  enum CodingKeys: String, CodingKey {
    case type
    case articlesResults = "results"
  }

  var type: String?
  var articlesResults: [ArticlesResults]?
  

  init () {
    
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    type = try container.decodeIfPresent(String.self, forKey: .type)
    articlesResults = try container.decodeIfPresent([ArticlesResults].self, forKey: .articlesResults)
    
  }

}
