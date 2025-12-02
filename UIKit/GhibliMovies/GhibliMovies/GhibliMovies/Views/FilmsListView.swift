//
//  SwiftUIView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-11-30.
//

import SwiftUI

struct FilmsListView: View {
    
    var films: [GMFilm]

    var body: some View {
        List(films) { film in
                /// Un navigation link con valor REQUIERE que su valor sea Hashable
            NavigationLink(value: film)
            {
                FilmImageView(urlString: film.image)
                    .frame(width: 100, height: 150)
                Text(film.title)
            }
        }
        .navigationDestination(for: GMFilm.self) { film in
            FilmDetailView(film: film)
        }
    }
}


#Preview {
    FilmsListView(films: [])
}
