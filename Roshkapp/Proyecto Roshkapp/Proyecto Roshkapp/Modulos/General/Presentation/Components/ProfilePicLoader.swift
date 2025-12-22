//
//  ProfilePicLoader.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import Kingfisher

struct ProfilePicLoader: View {
    let imageURL: String?
    let previewImage: UIImage?
    var size: CGFloat = 50

    var body: some View {
        Group {
            if let preview = previewImage {
                Image(uiImage: preview)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            } else if let urlString = imageURL, let url = URL(string: urlString) {

                KFImage(url)
                    .placeholder {
                        DefaultImageLoader(size: size)
                    }
                    .cacheOriginalImage()
                    .fade(duration: 0.25) 
                    .resizable()
            } else {
                DefaultImageLoader(size: size)
            }
        }
        .scaledToFill()
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}




#Preview {
    let photosVM = ProfilePicViewModel.mock()
    ProfilePicLoader(imageURL: "", previewImage: nil, size: 50)
        .environmentObject(photosVM)
        .withAppColors()
}
