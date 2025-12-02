//
//  FavoritesView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-12-01.
//

import SwiftUI

struct FavoritesScreen: View {
    let filmsViewModel : FilmsViewModel
    var body: some View {
        Text("Favorites")
    }
}

#Preview {
    FavoritesScreen(filmsViewModel: FilmsViewModel(service: MockGhibliService()))
}
