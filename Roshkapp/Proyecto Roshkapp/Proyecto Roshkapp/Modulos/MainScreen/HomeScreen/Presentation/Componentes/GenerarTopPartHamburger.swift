//
//  GenerarBotonesMenu.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import SwiftUI

struct GenerarTopPartHamburger: View {
    @EnvironmentObject var appState : AppState
    @Binding var isShowing : Bool
    var body: some View {
        VStack(alignment:.leading)
        {
            ProfilePic(user: appState.myUser, imageSize: 48, esMiPerfil: true)
            Text(UserModel.getNombreUsuario(usuario: appState.myUser))
                .font(.boldLarge)
                .foregroundStyle(Color.white)
            Text(appState.myUser.cargo?.nombre ?? "Funcionario")
                .font(.regularBody)
                .foregroundStyle(Color.white)
        }
        Spacer()
        Image(systemName: "xmark")
            .resizable()
            .foregroundStyle(Color.white)
            .frame(width: 18, height: 18)
            .onTapGesture {
                isShowing.toggle()
            }
            .padding(.bottom, 64)
    }
}

