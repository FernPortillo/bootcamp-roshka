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
    @Binding var isProfileShowing : Bool
    @State var editable : Bool = false
    var body : some View{
        // Si es nil, se coloca ""
        let dispositivos = user.equipos ?? []
        let correo = user.correo ?? ""
        let telefono = user.telefono ?? ""
        ScrollView{
            HStack{
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .onTapGesture {
                        isProfileShowing.toggle()
                    }
                Spacer()
            }
            .padding()
            VStack(alignment: .center){
                ProfileTop(user: user, editable: $editable)
                ContactoSection(correo: correo, telefono: telefono)
                DispositivosSection(dispositivos: dispositivos)
            }
            .padding()
        }
        .background(Color.appBackgroundColor)
    }
}

#Preview {
    @Previewable let photosVM = ProfilePicViewModel.mock()
    ProfileScreen(user: UserModel.mockUser, isProfileShowing: .constant(false))
    .environmentObject(photosVM)
}

