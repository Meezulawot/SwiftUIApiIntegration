//
//  BreedListView.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import SwiftUI

struct BreedListView: View {
    
    var breeds: [Breed]
    @State var searchableText : String = ""
    @EnvironmentObject var breedFetcherViewModel : BreedFetcherViewModel
    
    var filteredBreeds: [Breed] {
        if searchableText.count == 0{
            return breeds
        }else{
            return breeds.filter({ $0.name.contains(searchableText)})
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                SearchBar(placeholder: "Search...", text: $searchableText)
                
                List{
                    ForEach(filteredBreeds){ breed in
                        
                        NavigationLink {
                            
                            BreedDetailView(breed: breed)
                            
                        } label: {
                            BreedRow(breed: breed)
                        }
                        //                Image(systemName: "house.fill")
                        //                    .data(url: URL(string:breed.referenceImageID))
                        
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Find Your Perfect Cat")
            }
            
        }
        .onAppear{
            print("cache size : \(URLCache.shared.memoryCapacity / 1024)KB")
            URLCache.shared.memoryCapacity = 1024 * 1024 * 512
        }
        
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed]())
    }
}

struct SearchBar: View {
    var placeholder: String
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "house")
                .imageScale(.medium)
                .foregroundColor(Color.gray)
                .padding(.vertical, 12)
                .padding(.horizontal, 4)
                
            TextField(placeholder, text: $text)
                .background(Color(.systemGray6))
                .cornerRadius(3)
            
            if text != "" {
                Image(systemName: "xmark.circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(Color.gray)
                    .padding(12)
                    .onTapGesture {
                        withAnimation {
                            self.text = ""
                        }
                    }
            }
            
        }
        .background(Color(.systemGray6))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(.systemGray4), lineWidth: 1)
        )
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(placeholder: "Search...", text: .constant(""))
    }
}
