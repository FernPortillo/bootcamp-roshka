//
//  ListaSolicitudes.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct ListaSolicitudes: View {
    @EnvironmentObject var appState : AppState
    let solicitudes : [SolicitudesResponseModel]
    var body: some View {
        ForEach(solicitudes, id:\.idSolicitud) { solicitud in
            SolicitudCard(solicitud: solicitud, user: appState.myUser)
        }
    }
}

#Preview {
    @Previewable var r = Router()
    let a = AppState.mockAuthenticated()
    let p = ProfilePicViewModel.mock()
    ListaSolicitudes(solicitudes: SolicitudesResponseModel.solicitudesMock)
        .environmentObject(p)
        .environmentObject(a)
        .environment(r)
        .withAppColors()
}
