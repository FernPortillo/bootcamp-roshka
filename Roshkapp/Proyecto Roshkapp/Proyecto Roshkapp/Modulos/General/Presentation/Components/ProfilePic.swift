//
//  ProfilePic.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct ProfilePic: View {
    @Environment(Router.self) private var router
    @EnvironmentObject private var userVM: UserViewModel
    @EnvironmentObject private var profilePicVM : ProfilePicViewModel
    let user : UserModel
    var userEsTh : Bool = false
    var imageSize : CGFloat = 28
    var esMiPerfil : Bool = false
    
    var body: some View {
        ProfilePicLoader(imageURL: user.urlPerfil,
                         previewImage: esMiPerfil ? profilePicVM.localPreviewImage : nil,
                         size: imageSize)
        .onTapGesture {
            if esMiPerfil{
                print("Si, es mi perfil, yendo a profileScreen")
                router.navigate(to: .profile(user: user, permisosTH: userEsTh))
            }
            else if userEsTh{
                Task{
                    let user = await userVM.getUserById(idUser: user.idUsuario)
                }
                print(user)
                print("Ir al perfil")
            }
            else{
                print("No, no es mi perfil y no tengo permisos")
            }
        }
    }
    
}



#Preview {
    @Previewable var r = Router()
    let photosVM = ProfilePicViewModel.mock()
    ProfilePic(user: UserModel.mockUser)
        .withAppColors()
        .environmentObject(photosVM)
        .environment(r)
}
