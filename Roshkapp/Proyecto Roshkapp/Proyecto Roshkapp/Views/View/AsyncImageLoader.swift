//
//  AsyncImageLoader.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//

import SwiftUI

/// Para links
struct AsyncImageLoader: View {
    let url : String?
    let defaultImage : String = "default.avatar"
    var body: some View {
        if url == nil || url!.isEmpty
        {
            DefaultImageLoader()
        }
        else {
            let url = URL(string: url!)
            AsyncImage(url: url) {
                phase in
                switch phase {
                case .empty:
                    DefaultImageLoader()
                        .overlay{
                            ProgressView()
                                .controlSize(.large)
                        }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(_):
                    DefaultImageLoader()
                @unknown default:
                    fatalError()
                }
            }
        }
    }
}

struct DefaultImageLoader: View {
    var size: CGFloat = 50
    var body: some View {
        Image("default.avatar")
            .resizable()
            .frame(width: size, height: size)
    }
}




#Preview {
    let url = NovedadesModel.mockNovedadConImagen.imagenUrl
    AsyncImageLoader(url: url!)
}
