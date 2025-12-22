//
//  ProfileScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import Combine
import PhotosUI

struct ProfileScreen: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var appState : AppState
    @EnvironmentObject var photosVM : ProfilePicViewModel
    @State var esMiPerfil : Bool = true
    var userEnviado: UserModel = UserModel.mockUser
    var permisosTH: Bool = false
    var body : some View{
        let user : UserModel = esMiPerfil ? appState.myUser : userEnviado
        let dispositivos = user.equipos ?? []
        let correo = user.correo ?? ""
        let telefono = user.telefono ?? ""
        ScrollView{
            VStack(alignment: .center){
                ProfileTop(editable: $esMiPerfil, user: user)
                Divider()
                if esMiPerfil{
                    VacacionesPerfil(diasVacacionesUser: user.diasVacaciones, diasRestantesUser: user.diasVacacionesRestante)
                        .padding(.vertical, Spacing.s)
                    Divider()
                } 
                ContactoSection(correo: correo, telefono: telefono)
                Divider()
                ProyectosSection()
                Divider()
                DispositivosSection(dispositivos: dispositivos)
            }
            .padding(Spacing.xs)
        }
        .background(colors.appBackgroundColor)
        .onAppear {
            print("ProfileScreen appear")
            photosVM.onUploadSuccess = {newURL in
                appState.myUser.urlPerfil = newURL
                print("Actualizada la foto")
            }
            
            photosVM.onDeleteSuccess = {
                appState.myUser.urlPerfil = ""
            }
        }
        .onDisappear {
            print("ProfileScreen disappear")
        }

    }
}


#Preview {
    @Previewable let r = Router()
    let a = AppState.mockAuthenticated()
    let p = ProfilePicViewModel.mock()
    ProfileScreen(esMiPerfil: true)
        .environmentObject(a)
        .environmentObject(p)
        .environment(r)
        .withAppColors()
}
