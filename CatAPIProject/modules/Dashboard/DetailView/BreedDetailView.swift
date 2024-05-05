//
//  BreedDetailView.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 10/10/2023.
//

import SwiftUI

struct BreedDetailView: View {
    
    @EnvironmentObject var breedFetcherViewModel : BreedFetcherViewModel
    var breed : Breed
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3){
            ImageLoadingView(url: "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80")
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(Color.gray)
            
            Text(breed.name)
                .font(.headline)
                .padding()
            
            Text(breed.temperament)
                .padding(.horizontal)
            
            Text(breed.description)
                .padding()
            
            Spacer()
        }
//        .onAppear{
//            breedFetcherViewModel.fetchCatDetail(param: breed.referenceImageID ?? "")
//        }
    }
}

//struct BreedDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedDetailView(breed: )
//    }
//}
