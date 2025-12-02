//
//  SearchView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-12-01.
//

import SwiftUI

struct SearchScreen: View {
    
    @State private var text: String = ""
    var body: some View {
        NavigationStack {
            Text("Search")
                .searchable(text: $text)
        }
    }
}

#Preview {
    SearchScreen()
}
