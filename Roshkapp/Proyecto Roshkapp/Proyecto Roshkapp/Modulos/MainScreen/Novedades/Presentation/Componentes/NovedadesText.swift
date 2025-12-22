//
//  NovedadesText.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI
// Limite es 42 letras

struct NovedadesText: View {
    @EnvironmentObject var appState: AppState
    @State private var isNovedadFullyVisible = false
    @State private var lineLimit = 1
    let novedad : NovedadesModel
    var permisosTH: Bool = false
    var body: some View {
        let user = novedad.usuario
        let titulo = novedad.titulo
        let descripcion = novedad.descripcion
        let isNovedadTextoLongEnough = descripcion.count > 55
        VStack(alignment: .leading) {
            HStack{
                let esMiPerfil = appState.checkMyUser(user: user)
                ProfilePic(user: user, userEsTh: permisosTH, esMiPerfil: esMiPerfil)
                VStack(alignment: .leading){
                    Text(UserModel.getNombreUsuario(usuario: user))
                        .font(.regularMedium)
                }
                Spacer()
                if isNovedadTextoLongEnough{
                    Image(isNovedadFullyVisible ? "arrow.up.icon" : "arrow.down.icon")
                        .onTapGesture{
                            isNovedadFullyVisible.toggle()
                            
                            if isNovedadFullyVisible {
                                lineLimit = 12
                            }
                            else {
                                lineLimit = 1
                            }
                        }
                }
            }
            .padding()
            VStack(alignment: .leading){
                Text(titulo)
                    .font(.boldSmall)
                Text(descripcion)
                    .font(.regularSmall)
                    .lineSpacing(Letter.ls_wide)
                    .lineLimit(lineLimit)
            }
            .padding(.horizontal)
        }
        .padding(Spacing.m)
    }
}



#Preview {
    @Previewable var r = Router()
    let p = ProfilePicViewModel.mock()
    let a = AppState.mockAuthenticated()
    NovedadesText(novedad: NovedadesModel.mockNovedadText[0])
        .environmentObject(p)
        .environmentObject(a)
        .environment(r)
        .withAppColors()
}
