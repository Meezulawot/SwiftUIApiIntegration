//
//  CatAPIProjectApp.swift
//  CatAPIProject
//
//  Created by Meezu Lawot on 09/10/2023.
//

import SwiftUI

@main
struct CatAPIProjectApp: App {
    
    @StateObject var breedFetcherViewModel = BreedFetcherViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(breedFetcherViewModel)
        }
    }
}
