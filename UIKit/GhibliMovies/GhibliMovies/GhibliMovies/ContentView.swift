//
//  ContentView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var filmsViewModel = FilmsViewModel()
    var body: some View {
        TabView{
            Tab("Movies", systemImage: "movieclapper")
            {
                FilmsScreen(filmsViewModel: filmsViewModel)
            }
            Tab("Favorites", systemImage: "heart")
            {
                FavoritesScreen(filmsViewModel: filmsViewModel)
            }
            Tab("Settings", systemImage: "gear")
            {
                SettingsScreen()
            }
            Tab(role: .search){
                SearchScreen()
            }
        }
    }
}


#Preview {
    ContentView()
}
