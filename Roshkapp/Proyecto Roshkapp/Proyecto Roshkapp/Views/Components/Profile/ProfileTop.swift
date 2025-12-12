//
//  ProfileTop.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI
import PhotosUI

struct ProfileTop: View {
    let name : String
    let cargo : String
    let fechaEntrada : String
    let imageB64 : String?
    @State var showPicker = false
    @EnvironmentObject var photosVM : ProfilePicViewModel
    var body: some View {
        ProfilePicLoader(image: photosVM.imageB64 ?? (imageB64 ?? ""), size: 200)
        .overlay{
           ZStack{
               Circle()
                   .foregroundStyle(Color.appBackgroundColor)
               Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .foregroundStyle(Color.accentColor)
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
        
        Text(name)
            .font(.regularLarger)
            .padding()
        Text(cargo)
            .padding(.bottom)
            .font(.regularLarge)
        Text(fechaEntrada)
            .font(.lightMedium)
    }
    
    
}

//#Preview {
//    @Previewable let photosVM = PhotoViewModel()
//    ProfileTop(name: "Nombre y Apellido",
//               cargo: "Cargo",
//               fechaEntrada: "2020-11-12",
//               imageB64: nil)
//    
//    .environmentObject(photosVM)
//
//}
