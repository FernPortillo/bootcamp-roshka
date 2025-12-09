//
//  AsyncImageLoader.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//

import SwiftUI

struct AsyncImageLoader: View {
    let url : URL
    var body: some View {
        AsyncImage(url: url) {
            phase in
            switch phase {
            case .empty:
                Rectangle()
                    .overlay{
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(_):
                Text("Could not get Image")
                    .foregroundStyle(Color.pink)
            @unknown default:
                fatalError()
            }
        }

    }
}

#Preview {
    let url = URL(string: NovedadesModel.mockNovedad.imagenUrl!)
    AsyncImageLoader(url: url!)
}
