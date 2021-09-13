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
    case arts
    case science
    case us
    case world
}

extension NetworkServices: TargetType {
    
    var baseURL: URL {
        switch self {
        case .MostViewed, .Home, .arts, .science, .us, .world:
            return URL(string: "https://api.nytimes.com/svc/")!
        }
    }
     
    
    var path: String {
        switch self {
        case .MostViewed:
            return "mostpopular/v2/viewed/7.json"
        case .Home(let type):
            return "topstories/v2/" + type + ".json"
        case .arts:
            return "topstories/v2/" + "arts" + ".json"
        case .science:
            return "topstories/v2/science.json"
        case .us:
            return "topstories/v2/us.json"
        case .world:
            return "topstories/v2/world.json"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .MostViewed, .Home, .arts, .science, .us, .world:
            return .get
        }
    }
    
    
    var sampleData: Data {
        return Data()
    }
    
    
    var task: Task {
        switch self {
        case .MostViewed, .Home, .arts, .science, .us, .world:
            var dic = [String:Any]()
            dic["api-key"] = "CPt1AmkpaqzFqCxQERFJ0QTm7ssZnbeH"
            return .requestParameters(parameters: dic, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .MostViewed, .Home, .arts, .science, .us, .world:
            return [:]
        }
    }
}
