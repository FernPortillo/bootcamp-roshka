//
//  NovedadesText.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI
// Limite es 42 letras

struct NovedadesText: View {
    @State private var isNovedadFullyVisible = false
    @State private var lineLimit = 1
    let novedad : NovedadesModel
    let userVM: UserViewModel
    var body: some View {
        let user = novedad.usuario
        let titulo = novedad.titulo
        let descripcion = novedad.descripcion
        let isNovedadTextoLongEnough = descripcion.count > 55
        VStack(alignment: .leading) {
            HStack{
                let isMyUser = userVM.checkUserIsMyUser(user: user)
                ProfilePic(user: user, editable: isMyUser)
                VStack(alignment: .leading){
                    Text(UserModel.getNombreUsuario(usuario: user))
                        .font(.regularMedium)
//                    Text(tiempoPublicacion)
//                        .font(.regularSmaller)
                    
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
    @Previewable var photosVM = ProfilePicViewModel.mock()
    @State var uvm = UserViewModel.mockLoaded()
    NovedadesText(
        novedad: NovedadesModel.mockNovedadText[0], userVM: uvm)
    .environmentObject(photosVM)

}
