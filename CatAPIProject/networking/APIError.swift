//
//  APIError.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import Foundation
import Moya

enum APIError: Error, CustomStringConvertible{
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError)
    case parsing(DecodingError?)
    case unknown
    case moyaError(MoyaError?)
    case common(errorMessage: String)
    
    static var shared = APIError.self
    
    var localizedDescription: String{
        
        switch self{
        case .badURL, .parsing, .unknown:
            return "Something went wrong"
        case .badResponse(_):
            return "Sorry , the connection to our server failed"
        case .url(let error):
            return error.localizedDescription ?? "Something went wrong"
        case .moyaError(let error):
            return error?.localizedDescription ?? "No Internet Connection"
        case .common(let error):
            return error
        }
    }
    
    var description: String{
        switch self{
        case .unknown:
            return "Unknown Error"
        case .url(let error):
            return error.localizedDescription
        case .badURL:
            return "Invalid url error"
        case .badResponse(let statusCode):
            return "Bad response with status code: \(statusCode)"
        case .parsing(let error):
            return "Parsing error: \(error?.localizedDescription ?? "")"
        case .moyaError(let error):
            return error!.localizedDescription
        case .common(let error):
            return "Something went wrong: \(error)"
        }
    }
}

