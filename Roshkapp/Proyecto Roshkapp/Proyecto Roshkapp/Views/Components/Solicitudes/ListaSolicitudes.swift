//
//  ListaSolicitudes.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct ListaSolicitudes: View {
    let solicitudes : [SolicitudesResponseModel]
    var body: some View {
        ForEach(solicitudes, id:\.idSolicitud) { solicitud in
            SolicitudCard(solicitud: solicitud)
        }
    }
}

#Preview {
    @Previewable let pVM = ProfilePicViewModel.mock()
    ListaSolicitudes(solicitudes: SolicitudesResponseModel.solicitudesMock)
        .environmentObject(pVM)
}
