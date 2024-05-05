//
//  APIService.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import Foundation

struct APIService{
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void){
        guard let url = url else{
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error = error as? URLError{
                completion(Result.failure(APIError.url(error)))
                
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                
            }else if let data = data{
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(type, from: data)
                    print(result)
                    DispatchQueue.main.async {
                        completion(Result.success(result))
                    }
                    
                }catch{
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }

    }
    
    
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void){
        
        guard let url = url else{
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
             print(" responseError: \(error)")
            if let error = error as? URLError{
                completion(Result.failure(APIError.url(error)))
                
            }else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
                
            }else if let data = data{
                let decoder = JSONDecoder()
                do{
                    let breeds = try decoder.decode([Breed].self, from: data)
                    print(" responseData: \(breeds)")
                    DispatchQueue.main.async {
                        completion(Result.success(breeds))
                    }
                    
                }catch{
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()

    }
}
