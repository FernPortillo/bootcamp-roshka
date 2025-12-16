//
//  UserWelcom.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

struct UserWelcome: View {
    @State private var isProfileShowing = false
    let user: UserModel
    var editable: Bool = false
    @EnvironmentObject var photosVM : ProfilePicViewModel
    var body: some View {
        VStack(alignment: .leading){
            ProfilePicLoader(image: photosVM.imageB64 ?? (user.urlPerfil ?? ""), size: 32)
                .onTapGesture {
                    isProfileShowing.toggle()
                }
                .sheet(isPresented: $isProfileShowing)
            {
                ProfileScreen(user: user, isProfileShowing: $isProfileShowing, editable: editable)
            }
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
