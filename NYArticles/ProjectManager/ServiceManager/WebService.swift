//
//  WebService.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import Moya


enum NetworkServices {
    case MostViewed
    case Home(type: String)
}

extension NetworkServices: TargetType {
    
    var baseURL: URL {
        switch self {
        case .MostViewed, .Home:
            return URL(string: "https://api.nytimes.com/svc/")!
        }
    }
     
    
    var path: String {
        switch self {
        case .MostViewed:
            return "mostpopular/v2/viewed/7.json"
        case .Home(let type):
            return "topstories/v2/\(type).json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        
        case .MostViewed, .Home:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        
        case .MostViewed, .Home:
            
            var dic = [String:Any]()
            dic["api-key"] = "CPt1AmkpaqzFqCxQERFJ0QTm7ssZnbeH"
            
            return .requestParameters(parameters: dic, encoding: URLEncoding.queryString)
        
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .MostViewed, .Home :
            return [:]
        
        }
    }
}
