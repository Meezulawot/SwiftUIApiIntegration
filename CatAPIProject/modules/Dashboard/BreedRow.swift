//
//  BreedRow.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 10/10/2023.
//

import SwiftUI

struct BreedRow: View {
    
    let breed: Breed
    
    var body: some View {
        HStack{
            if breed.wikipediaURL != nil{
//                ImageLoadingView(url: AppURL.baseURL + "/images/\(breed.referenceImageID!)")
                ImageLoadingView(url: "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80")
            }else{
                Color.gray.frame(width: 100, height: 100)
            }
                
            VStack(alignment: .leading, spacing: 5){
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
            
        }
        
    }
}

//struct BreedRow_Previews: PreviewProvider {
//    static var previews: some View {
//        BreedRow(breed: Breed(from: <#Decoder#>))
//    }
//}
