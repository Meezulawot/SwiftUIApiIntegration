//
//  CatsBreedAPI.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 10/10/2023.
//

import Foundation
import Moya

struct AppURL{
    static var baseURL = "https://api.thecatapi.com/v1/"
    static var breeds = "breeds"
    static var individualImage = "images/"
}

enum CatsBreedAPI{
    case getBreeds
    case getIndividualCatImage(image_id: String)
}

extension CatsBreedAPI: TargetType{
    var baseURL: URL {
        guard let url = URL(string: AppURL.baseURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self{
        case .getBreeds:
            return AppURL.breeds
            
        case .getIndividualCatImage:
            return AppURL.individualImage
        }
    }
    
    
    var method: Moya.Method {
        switch self{
        case .getBreeds, .getIndividualCatImage:
            return .get
        }
        
    }
    
    var task: Moya.Task {
        switch self{
        case .getBreeds:
            return .requestPlain
        case .getIndividualCatImage(let param):
            return .requestParameters(parameters: [
                "image_id" : param
            ], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
