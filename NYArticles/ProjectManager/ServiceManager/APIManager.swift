//
//  APIManager.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation
import Moya

class APIManager {
    let Provider = MoyaProvider<NetworkServices>()
    private static var instance = APIManager()
    
    
    public static var shared: APIManager {
        return instance
    }
    
    
    //MARK:- Most Viewed
    func mostViewed(finalResult:@escaping (Result<MostViewedModel,ErrorModel>)-> Void) {
        Provider.request(.MostViewed) { (response) in
            self.processResponse(result: response, completion: finalResult)
        }
    }
    
    //MARK:- Home
    func homeArticals(finalResult:@escaping (Result<TopStoriesModel,ErrorModel>)-> Void) {
        Provider.request(.Home(type: "world")) { (response) in
            self.processResponse(result: response, completion: finalResult)
        }
    }
    
    //MARK:- Arts
    func ArtsArticals(finalResult:@escaping (Result<TopStoriesModel,ErrorModel>)-> Void) {
        Provider.request(.arts) { (response) in
            self.processResponse(result: response, completion: finalResult)
        }
    }
    
    //MARK:- Science
    func ScienceArticals(finalResult:@escaping (Result<TopStoriesModel,ErrorModel>)-> Void) {
        Provider.request(.science) { (response) in
            self.processResponse(result: response, completion: finalResult)
        }
    }
    
    //MARK:- US
    func USArticals(finalResult:@escaping (Result<TopStoriesModel,ErrorModel>)-> Void) {
        Provider.request(.us) { (response) in
            self.processResponse(result: response, completion: finalResult)
        }
    }
    
    //MARK:- World
    func WorldArticals(finalResult:@escaping (Result<TopStoriesModel,ErrorModel>)-> Void) {
        Provider.request(.world) { (response) in
            self.processResponse(result: response, completion: finalResult)
        }
    }
    

}
extension APIManager {
    func processResponse<T>(result:Result<Moya.Response,MoyaError>,completion: (Result<T,ErrorModel>) -> ()) where T: Codable {
        switch result {
        case .success(let response):
            do {
                print(try response.mapJSON())
            }catch(let error) {
                print(error)
            }
            switch response.statusCode {
            case 200...209:
                do {
                    let json = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(json))
                }catch (let error) {
                    completion(.failure(.unknown(error: error.localizedDescription)))
                }
            case 401...499:
                completion(.failure(ErrorModel.unAuthorized))
            case 500...599:
                completion(.failure(ErrorModel.serverError))
            default:
                completion(.failure(ErrorModel.serverError))
            }
        case .failure(let error):
            completion(.failure(.unknown(error: error.localizedDescription)))
        }
    }
}
