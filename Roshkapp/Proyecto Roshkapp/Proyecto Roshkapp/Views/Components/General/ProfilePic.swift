//
//  ProfilePic.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct ProfilePic: View {
    @State var isProfileShowing : Bool = false
    let user : UserModel
    var imageSize : CGFloat = 28
    var editable : Bool = false
    var body: some View {
        ProfilePicLoader(image: user.urlPerfil ?? "",
                         size: imageSize)
            .onTapGesture {
                isProfileShowing.toggle()
            }
            .sheet(isPresented: $isProfileShowing)
        {
            ProfileScreen(user: user, isProfileShowing: $isProfileShowing, editable: editable)
        }
    }
    
}

//#Preview {
//    @Previewable let photosVM = PhotoViewModel()
//    ProfilePic(user: UserModel.mockUser)
//        .environmentObject(photosVM)
//}
