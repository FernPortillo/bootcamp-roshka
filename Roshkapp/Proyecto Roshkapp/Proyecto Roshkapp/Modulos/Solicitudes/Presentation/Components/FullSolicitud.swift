//
//  FullSolicitud.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct FullSolicitud: View {
    @Environment(\.appColors) var colors
    let solicitud : SolicitudesResponseModel
    @Binding var isShowingFull : Bool


    var body: some View {
        let nombreUser = solicitud.nombreUsuario
        let nombreLider = solicitud.nombreLider ?? "-"
        let tipoSolicitud = solicitud.tipoSolicitud
        let subtipo = solicitud.nombreSubTipoSolicitud ?? "-"
        let comentario = solicitud.comentario
        let fecha = solicitud.fechaInicio
        let status = solicitud.estado
        
        HStack{
            VStack(alignment: .leading){
                Button(action: { isShowingFull.toggle() }){
                    Label("Volver", systemImage: "arrow.backward")
                        .font(.regularBody)
                        .foregroundStyle(colors.mainColor)
                }
            }
            Spacer()
        }
        .padding()

        VStack{
            Text("Solicitud de \(nombreUser)")
                .padding(.top)
            VStack(alignment: .leading){
                Divider()
                Text("Lider:")
                    .font(.regularSmaller)
                Text(nombreLider)
                    .font(.regularBody)
                    .padding(.bottom, Spacing.xs)

                
                Text("Tipo:")
                    .font(.regularSmaller)
                Text(tipoSolicitud.capitalized)
                    .font(.regularBody)
                    .padding(.bottom, Spacing.xs)
                
                Text("Subtipo")
                    .font(.regularSmaller)
                Text(subtipo)
                    .font(.regularBody)
                    .padding(.bottom, Spacing.xs)

                Text("Comentario:")
                    .font(.regularSmaller)
                Text(comentario ?? "")
                    .font(.regularBody)
                    .padding(.bottom, Spacing.xs)

                Text("Fecha de Inicio:")
                    .font(.regularSmaller)
                Text(fecha)
                    .font(.regularBody)
                    .padding(.bottom, Spacing.xs)

                Text("Estado:")
                    .font(.regularSmaller)
                StatusSolicitud(status: status)
            }
            .padding()
        }
        .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(colors.darkBackgroundColor)
        )
        .padding()
        Spacer()
    }
}

#Preview {
    let p = ProfilePicViewModel.mock()
    FullSolicitud(solicitud: SolicitudesResponseModel.mockSolicitud, isShowingFull: .constant(false))
        .environmentObject(p)
        .withAppColors()
}
