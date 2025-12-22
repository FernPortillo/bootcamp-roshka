//
//  NotificacionImageFull.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct NovedadImageFull: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var appState: AppState
    let novedad : NovedadesModel
    var permisosTH: Bool
    var body: some View {
        let imagenUrl = URL(string: novedad.imagenUrl!)
        let user = novedad.usuario
        let esMiPerfil = appState.checkMyUser(user: user)
        ScrollView{
            VStack(alignment: .leading)
            {
                HStack{
                    ProfilePic(user: user, userEsTh: permisosTH, esMiPerfil: esMiPerfil)
                    Text(UserModel.getNombreUsuario(usuario: user))
                        .font(.regularMedium)
                }
                VStack(alignment: .leading){
                    Text(novedad.titulo)
                        .font(.boldLarge)
                        .padding(.top, Spacing.m)
                    Text(novedad.descripcion)
                        .font(.regularLarge)
                        .padding(.vertical, Spacing.m)
                    Divider()
                }
                AsyncImageLoader(url: imagenUrl)
                    .clipped()
                    .scaledToFit()
                    .padding(.top, Spacing.m)
            }
            .padding()
        }
        .background(colors.appBackgroundColor)
    }
}


#Preview {
    @Previewable var r = Router()
    let p = ProfilePicViewModel.mock()
    let a = AppState.mockAuthenticated()
    NovedadImageFull(novedad: NovedadesModel.mockNovedadConImagen, permisosTH: false)
        .environmentObject(p)
        .environmentObject(a)
        .environment(r)
        .withAppColors()
}
