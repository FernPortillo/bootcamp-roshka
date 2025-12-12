//
//  ProfileScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import PhotosUI

struct ProfileScreen: View {
    let user : UserModel
    var body : some View{
        // Si es nil, se coloca ""
        let nombre = UserModel.getNombreUsuario(usuario: user)
        let dispositivos = user.equipos ?? []
        let image = user.urlPerfil ?? ""
        ScrollView{
            ProfileTop(name: nombre,
                           cargo: user.cargo!.nombre,
                           fechaEntrada: user.fechaIngreso!,
                           imageB64: image)
            ContactoSection(correo: "aa@gmail.com", telefono: "09999999")
                .padding(.vertical)
            DispositivosSection(dispositivos: dispositivos)
        }
        .background(Color.appBackgroundColor)
    }
}

#Preview {
    @Previewable let photosVM = ProfilePicViewModel.mock()
    ProfileScreen(user: UserModel.mockUser)
    .environmentObject(photosVM)
}

