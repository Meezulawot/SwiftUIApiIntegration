//
//  ErrorView.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var breedFetcherViewModel: BreedFetcherViewModel
    
    var body: some View {
        ZStack{
            Text(breedFetcherViewModel.errorMessage)
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedFetcherViewModel: BreedFetcherViewModel())
    }
}
