//
//  ProfilePicLoader.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct ProfilePicLoader: View {
    @EnvironmentObject var photosVM : ProfilePicViewModel
    let image: String
    var size : CGFloat = 50

    var body: some View {
        if let image = photosVM.base64ToImage(image) {
            image
                .resizable()
                .frame(width: size, height: size)
                .clipShape(.circle)
        } else {
            DefaultImageLoader(size: size)
        }
    }
}



//#Preview {
//    @Previewable let photosVM = PhotoViewModel()
//    ProfilePicLoader(image: "", size: 50)
//        .environmentObject(photosVM)
//}
