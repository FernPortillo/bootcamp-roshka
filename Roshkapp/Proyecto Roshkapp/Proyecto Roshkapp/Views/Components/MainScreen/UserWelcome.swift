//
//  UserWelcom.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

// Imagen deberia ser clicable
struct UserWelcome: View {
    let user: UserModel
    @EnvironmentObject var photosVM : ProfilePicViewModel
    var body: some View {
        VStack(alignment: .leading){
            ProfilePicLoader(image: photosVM.imageB64 ?? (user.urlPerfil ?? ""), size: 32)
            Text("Bienvenido! \(user.nombre)")
        }
    }
}

//#Preview {
//    @Previewable let photosVM = PhotoViewModel()
//    let user = UserModel.mockUser
//    UserWelcome(user: user)
//        .environmentObject(photosVM)
//}
