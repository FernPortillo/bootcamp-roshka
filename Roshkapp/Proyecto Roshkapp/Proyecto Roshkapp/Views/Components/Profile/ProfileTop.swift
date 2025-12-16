//
//  ProfileTop.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import PhotosUI

struct ProfileTop: View {
    let user: UserModel
    @State var showPicker = false
    @Binding var editable: Bool
    @EnvironmentObject var photosVM : ProfilePicViewModel
    var body: some View {
        let nombre = UserModel.getNombreUsuario(usuario: user)
        let cargo = user.cargo?.nombre ?? ""
        let fecha = user.fechaIngreso ?? ""
        let image: String = {
            if photosVM.checkIfMyUser(user: user),
               let imageB64 = photosVM.imageB64,
               !imageB64.isEmpty {
                return imageB64
            } else {
                return user.urlPerfil ?? ""
            }
        }()
        ProfilePicLoader(image: image, size: 200)
            .overlay{
                ZStack{
                    if editable{
                        Circle()
                            .foregroundStyle(Color.appBackgroundColor)
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .foregroundStyle(Color.accentColor)
                    }
                }
                .frame(width: 64, height: 64)
                .offset(x: 48, y: 64)
                .onTapGesture {
                    showPicker = true
                }
                .photosPicker(isPresented: $showPicker,
                              selection: $photosVM.photoPickerItem,
                              matching: .images)
            }
        
        Text(nombre)
            .font(.regularLarger)
            .padding()
        Text(cargo)
            .padding(.bottom)
            .font(.regularLarge)
        Text(fecha)
            .font(.lightMedium)
        RolBadge(rol: user.rol)
    }
    
}

#Preview() {
    @Previewable let photosVM = ProfilePicViewModel.mock()
    ProfileTop(user: UserModel.mockUser2,
               editable: .constant(false))
    
    .environmentObject(photosVM)

}
