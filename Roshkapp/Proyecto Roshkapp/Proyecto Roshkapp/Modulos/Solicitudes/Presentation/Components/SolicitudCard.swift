//
//  SolicitudCart.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct SolicitudCard: View {
    @Environment(\.appColors) var colors
    @State private var isShowingFull = false
    @EnvironmentObject var userVM: UserViewModel
    let solicitud : SolicitudesResponseModel
    let user : UserModel

    var body: some View {
        let status = solicitud.estado
            VStack(alignment: .leading){
                HStack{
                    ProfilePic(user: user)
                    Text(solicitud.nombreUsuario)
                    Spacer()
                    StatusSolicitud(status: status)
                }
                .padding(.vertical, Spacing.s)
                let time = solicitud.fechaInicio.toReadableDate()
                let tipo = solicitud.tipoSolicitud.lowercased()
                Text("Solicitud de \(tipo) realizada para el \(time)")
                    .font(Font.regularSmall)
                    .padding(.bottom, Spacing.xs)
                Button(action: {isShowingFull.toggle()})
                {
                    Text("Ver detalles")
                        .font(.regularSmall)
                        .foregroundStyle(colors.yetDarkerBackgroundColor)
                }
        }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(colors.darkBackgroundColor)
            )
            .sheet(isPresented: $isShowingFull)
        {
            FullSolicitud(solicitud: solicitud, isShowingFull: $isShowingFull)
                .presentationBackground(colors.appBackgroundColor)
        }
    }
}

#Preview {
    @Previewable var r = Router()
    let p = ProfilePicViewModel.mock()
    SolicitudCard(solicitud: SolicitudesResponseModel.mockSolicitud, user: UserModel.mockUser2)
        .environment(r)
        .environmentObject(p)
        .withAppColors()
}

