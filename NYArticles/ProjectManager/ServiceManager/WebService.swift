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

}

extension NetworkServices: TargetType {
    
    var baseURL: URL {
        switch self {
        case .MostViewed:
            return URL(string: "https://api.nytimes.com/svc/")!
        }
    }
     
    
    var path: String {
        switch self {
        case .MostViewed:
            return "mostpopular/v2/viewed/7.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        
        case .MostViewed:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        
        switch self {
        
        case .MostViewed:
            
            var dic = [String:Any]()
            dic["api-key"] = "CPt1AmkpaqzFqCxQERFJ0QTm7ssZnbeH"
            
            return .requestParameters(parameters: dic, encoding: URLEncoding.queryString)
        
        }
    }
    
    var headers: [String : String]? {
        
        switch self {
        case .MostViewed :
            return [:]
        
        }
    }
}
