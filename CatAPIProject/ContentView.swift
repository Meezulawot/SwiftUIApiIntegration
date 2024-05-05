//
//  ContentView.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var breedFetcherViewModel: BreedFetcherViewModel
    
    var body: some View {
        if breedFetcherViewModel.isLoading {
            LoadingView()
        }else if breedFetcherViewModel.errorMessage != ""{
            ErrorView(breedFetcherViewModel: breedFetcherViewModel)
        }else{
            BreedListView(breeds: breedFetcherViewModel.breeds)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
