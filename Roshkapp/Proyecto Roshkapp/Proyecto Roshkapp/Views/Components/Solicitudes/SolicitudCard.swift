//
//  SolicitudCart.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct SolicitudCard: View {
    @State private var isShowingFull = false
    let solicitud : SolicitudesResponseModel
    let user : UserModel = UserModel.mockUser
    var body: some View {
        let status = solicitud.estado
            VStack(alignment: .leading){
                HStack{
                    ProfilePic(user: user)
                    Text(UserModel.getNombreUsuario(usuario: user))
                    Spacer()
                    StatusSolicitud(status: status)
                }
                .padding(.vertical, Spacing.s)
                let time = calcularTimeStamp(fecha: solicitud.fechaInicio)
                let tipo = solicitud.tipoSolicitud.lowercased()
                Text("Solicitud de \(tipo) realizada para el \(time)")
                    .font(Font.regularSmall)
                    .padding(.bottom, Spacing.xs)
                Button(action: {isShowingFull.toggle()})
                {
                    Text("Ver detalles")
                        .font(.regularSmall)
                        .foregroundStyle(Color.mainColor)
                }
        }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.darkBackgroundColor)
            )
            
            .sheet(isPresented: $isShowingFull)
        {
            FullSolicitud(solicitud: solicitud, isShowingFull: $isShowingFull)
                .presentationBackground(Color.appBackgroundColor)
        }
    }
}

#Preview {
    @Previewable let pVM = ProfilePicViewModel.mock()
    SolicitudCard(solicitud: SolicitudesResponseModel.mockSolicitud)
        .environmentObject(pVM)
}
