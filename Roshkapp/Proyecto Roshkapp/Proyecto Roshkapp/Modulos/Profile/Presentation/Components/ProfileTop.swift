//
//  ProfileTop.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import PhotosUI

struct ProfileTop: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var appState : AppState
    @EnvironmentObject var photosVM : ProfilePicViewModel
    @State var showGalleryPhotoPicker = false
    @Binding var editable: Bool
    let user: UserModel
    
    var body: some View {
        let nombre = UserModel.getNombreUsuario(usuario: user)
        let cargo = user.cargo?.nombre ?? ""
        let fecha = user.fechaIngreso ?? ""
        let antiguedad = user.antiguedadCalculada

        var colorText : Color {
            switch antiguedad.years{
            case 0...5:
                colors.approvedTextColor
            case 6...10:
                colors.mainColor
            default:
                colors.accentColor
            }
        }
        var colorBG : Color {
            switch antiguedad.years{
            case  0...5:
                colors.approvedBackgroundColor
            case 6...10:
                colors.clearMainColor
            default:
                colors.accentLighter
            }
        }
        
        ProfilePic(user: user, imageSize: 200, esMiPerfil: editable)
            .overlay{
                ZStack{
                    if editable{
                        // Verificar si tiene foto, si tiene, la puede borrar
                        Circle()
                            .foregroundStyle(colors.appBackgroundColor)
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .foregroundStyle(colors.accentColor)
                    }
                }
                .frame(width: 64, height: 64)
                .offset(x: 48, y: 64)
                .contextMenu {
                    Button{
                        showGalleryPhotoPicker = true
                    } label: {
                        Label("Elegir Foto de Galeria", systemImage: "photo")
                    }
                    Button(role: .destructive){
                        print("Borrar foto")
                    } label: {
                        Label("Eliminar Foto", systemImage: "trash")
                    }
                }
                .photosPicker(isPresented: $showGalleryPhotoPicker,
                              selection: $photosVM.photoPickerItem,
                              matching: .images)
            }
        
        VStack{
            Text(nombre)
                .font(.regularLarger)
                .padding()
            Text(cargo)
                .padding(.bottom)
                .font(.regularLarge)
            Text(fecha)
                .font(.lightMedium)
            
            
            RolBadge(rol: user.rol, antiguedadColorBG: colorBG, letraAntiguedadColor: colorText)
        }
        .padding(.vertical, Spacing.s)
    }
    
}

#Preview {
    @Previewable var r = Router()
    let p = ProfilePicViewModel.mock()
    let a = AppState.mockAuthenticated()
    ProfileTop(showGalleryPhotoPicker: false, editable: .constant(true), user: UserModel.mockUser)
        .environmentObject(p)
        .environmentObject(a)
        .environment(r)
        .withAppColors()
}
