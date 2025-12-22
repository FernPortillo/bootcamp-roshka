//
//  AsyncImageLoader.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-20.
//


import SwiftUI
struct AsyncImageLoader: View {
    let url : URL?
        
    init(urlString: String) {
        self.url = URL(string: urlString)
    }
        
        init(url: URL?)
    {
        self.url = url
    }
    var body: some View {
        AsyncImage(url: url) {
            phase in
            switch phase {
            case .empty:
                Rectangle()
                    .foregroundStyle(Color.gray)
                    .frame(width: 400, height: 400)
                    .overlay{
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure(_):
                Rectangle()
                    .foregroundStyle(Color.gray)
                    .frame(width: 400, height: 400)
                    .overlay(){
                        VStack(alignment: .center){
                            Text("No se pudo traer la imagen, comprueba tu conexion a Internet")
                                .font(.regularBody)
                        }
                    }
            @unknown default:
                fatalError()
                
            }
        }
    }
}



