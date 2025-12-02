//
//  FilmDetailView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-12-01.
//

import SwiftUI

struct FilmDetailView: View {
    
    let film : GMFilm
    
    
    /// VM creado solo aca, muere con la view
    @State private var vm = FilmDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                FilmImageView(urlString: film.bannerImage)
                    .frame(height: 300)
                    .clipped()
                    .containerRelativeFrame(.horizontal)
                
                VStack(alignment: .leading){
                    Text(film.title)
                    
                    Divider()
                    Text("Characters")
                        .font(.title3)
                    
                    
                    switch vm.state
                    {
                    case .idle : EmptyView()
                    case .loading: ProgressView()
                    case .loaded(let people):
                        ForEach(people) { person in
                            Text(person.name)
                        }
                    case .error(let error):
                        Text(error)
                            .foregroundStyle(.pink)
                    }
                }
                .padding()
            }
            /// equivalente Async a viewDidAppear, cuando salis de la view la task se cancela
            .task {
                await vm.fetch(for: film)
            }
        }
    }
}

#Preview {
    FilmDetailView(film: GMFilm.exampleFilm)
}
