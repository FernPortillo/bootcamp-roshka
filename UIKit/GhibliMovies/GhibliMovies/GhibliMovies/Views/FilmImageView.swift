//
//  FilmImageView.swift
//  GhibliMovies
//
//  Created by Bootcamp on 2025-12-01.
//

import SwiftUI

struct FilmImageView: View {
    
    let url : URL?
    let blurSize : CGFloat
    
    init(urlString: String) {
        self.url = URL(string: urlString)
        self.blurSize = 0
    }
    
    init(url: URL?, blur: CGFloat)
    {
        self.url = url
        self.blurSize = blur

    }
    
    var body: some View {
        AsyncImage(url: url) {
            phase in
            switch phase {
            case .empty:
                Image(systemName: "movieImage")
                    .blur(radius: blurSize)
                    .overlay{
                        ProgressView()
                            .controlSize(.large)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .blur(radius: blurSize)
            case .failure(_):
                Text("Could not get Image")
            @unknown default:
                fatalError()
            }
        }
    }
}

#Preview("poster") {
    let name = "movieImage"
    let url = URL.convertAssetImage(forImageNamed: name)
    
    FilmImageView(url: url, blur: 0)
        .frame(height: 150)

}
#Preview("banner"){
    let url = URL.convertAssetImage(forImageNamed: "imageBanner")

    FilmImageView(url: url, blur: 10)
        .frame(height: 300)

}


