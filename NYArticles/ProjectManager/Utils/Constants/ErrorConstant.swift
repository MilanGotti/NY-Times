//
//  ErrorConstant.swift
//  NYArticles
//
//  Created by iMac on 08/09/21.
//

import Foundation

enum errorMessage:String {
    case unAuthorized = "unauthorised user."
    case serverError = "Something went wrong with server. Please try again later."
    case noInternet = "No internet connection."
}

enum ErrorModel:Error {
    
    case unAuthorized
    case serverError
    case unknown(error: String)
    
    func description() -> String {
        switch self {
        case .serverError:
            return errorMessage.serverError.rawValue
        case .unAuthorized:
            return errorMessage.unAuthorized.rawValue
        case .unknown(let error):
            return error
        }
    }
}


enum SuccessStatus : String {
    case success = "Success"
    case error = "Error"
}
