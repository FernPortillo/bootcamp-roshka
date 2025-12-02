//
//  FilmsView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-12-01.
//

import SwiftUI

struct FilmsScreen: View {
    
    let filmsViewModel : FilmsViewModel
    
    var body: some View {
        NavigationStack{
            Group {
            switch filmsViewModel.state {
            case .idle:
                Text("No hay peliculas todavia")
            case .loading:
                Text("Cargando")
            case .loaded(let films):
                FilmsListView(films: films)
            case .error(let error):
                Text(error)
                    .foregroundStyle(.pink)
            }
        }
            .navigationTitle("Ghibli Movies")
        }
        .task{
            await filmsViewModel.fetch()
        }
    }
}

#Preview {
    FilmsScreen(filmsViewModel: FilmsViewModel(service: MockGhibliService()))
}
