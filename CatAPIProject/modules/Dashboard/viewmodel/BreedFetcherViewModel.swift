//
//  BreedFetcher.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import Foundation


class BreedFetcherViewModel: ObservableObject{
    
    @Published var breeds = [Breed]()
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var cat: Cat?
    
    fileprivate let networkManager = NetworkManager()
    
    init(){
        fetchBreeds()
    }
    
    func fetchBreeds(){
        
        self.isLoading = true
        self.errorMessage = ""
        
        networkManager.requestBreedResponse{ [weak self] result in
            guard self != nil else { return }
            
            self?.isLoading = false
            switch result {
            case .success(let userResponse):
                self?.breeds = userResponse
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
    
    func fetchCatDetail(param : String){
        
        self.isLoading = true
        self.errorMessage = ""
        networkManager.requestIndividualCatImage(param: param, completion: ({ [weak self] result in
            guard self != nil else { return }
            
            self?.isLoading = false
            switch result {
            case .success(let userResponse):
                self?.cat = userResponse
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        })
        )
        
    }
    
//    func fetchAllBreeds(){
//
//        isLoading = true
//        errorMessage = ""
//
//        let url = URL(string: "https://api.thecatapi.com/v1/breeds")
//
//        APIService().fetchBreeds(url: url, completion: { result in
//
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result{
//                case .failure(let error):
//                    self.errorMessage = error.localizedDescription
//                    print("errorMessages: \(error)")
//                case .success(let breeds):
//                    self.breeds = breeds
//                    print("successdata: \(breeds)")
//                }
//            }
//
//        })
//    }
    
}
