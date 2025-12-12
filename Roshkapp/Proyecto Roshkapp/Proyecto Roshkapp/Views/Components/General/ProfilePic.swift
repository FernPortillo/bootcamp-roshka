//
//  ProfilePic.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct ProfilePic: View {
    let user : UserModel
    var imageSize : CGFloat = 28
    var body: some View {
        ProfilePicLoader(image: user.urlPerfil ?? "",
                         size: imageSize)
            .onTapGesture {
                print("go to profile")
            }
    }
}

//#Preview {
//    @Previewable let photosVM = PhotoViewModel()
//    ProfilePic(user: UserModel.mockUser)
//        .environmentObject(photosVM)
//}
