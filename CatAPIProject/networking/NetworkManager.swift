//
//  NetworkManager.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 10/10/2023.
//

import Foundation
import Moya


protocol Networkable {
    var provider: MoyaProvider<CatsBreedAPI> { get }
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<CatsBreedAPI>(plugins: [NetworkLoggerPlugin()])
    
}

extension NetworkManager {
    
    func requestBreedResponse(completion: @escaping (Result<[Breed], Error>) -> ()) {
        provider.request(.getBreeds) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let breeds = try decoder.decode([Breed].self, from: response.data)
                    DispatchQueue.main.async {
                        completion(.success(breeds))
                    }
                    
                } catch (let error) {
                    completion(.failure(APIError.shared.parsing(error as? DecodingError)))
                }
            case .failure(let error):
                
                if let error = error as? HTTPURLResponse {
                    if !(200...299).contains(error.statusCode){
                        completion(.failure(APIError.shared.badResponse(statusCode: error.statusCode)))
                    }
                }else if let response = error as? MoyaError {
                    completion(.failure(APIError.shared.moyaError(error)))
                    
                }else{
                    completion(.failure(APIError.shared.common(errorMessage: error.localizedDescription)))
                }
                
                
            }
        }
    }
    
    func requestIndividualCatImage(param: String, completion: @escaping (Result<Cat, Error>) -> ()) {
        provider.request(.getIndividualCatImage(image_id: param)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(Cat.self, from: response.data)
                    DispatchQueue.main.async {
                        completion(.success(data))
                    }
                    
                } catch (let error) {
                    completion(.failure(APIError.shared.parsing(error as? DecodingError)))
                }
            case .failure(let error):
                
                if let error = error as? HTTPURLResponse {
                    if !(200...299).contains(error.statusCode){
                        completion(.failure(APIError.shared.badResponse(statusCode: error.statusCode)))
                    }
                }else if let response = error as? MoyaError {
                    completion(.failure(APIError.shared.moyaError(error)))
                    
                }else{
                    completion(.failure(APIError.shared.common(errorMessage: error.localizedDescription)))
                }
                
                
            }
        }
    }
    
}


