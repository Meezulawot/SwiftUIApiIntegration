//
//  ImageLoadingView.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 11/10/2023.
//

import SwiftUI

struct ImageLoadingView: View {
    
    @StateObject var imageLoader : ImageLoader
    
    init(url: String?){
        self._imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    let imageSize : CGFloat = 100
    
    var body: some View {
        
        Group{
            if imageLoader.image != nil{
                Image(uiImage: imageLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()
                
            }else if imageLoader.errorMessage != nil{
                Text(imageLoader.errorMessage!)
                    .foregroundColor(Color.pink)
                    .frame(width: imageSize, height: imageSize)
            }else{
                ProgressView()
                    .frame(width: imageSize, height: imageSize)
            }
        }
        .onAppear{
            imageLoader.fetchImage()
        }
        
    }
}

//struct ImageLoadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageLoadingView(url: "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80")
//    }
//}
