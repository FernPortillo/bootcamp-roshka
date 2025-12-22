//
//  Destination-ViewMapping.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import Foundation
import SwiftUI

@ViewBuilder func view(for destination: PushDestination) -> some View{
    switch destination {
    case let .novedadesFullScreen(novedad, permisosTH):
        NovedadImageFull(novedad: novedad, permisosTH: permisosTH)
    case let .profile(user, permisosTH):
        ProfileScreen(userEnviado: user, permisosTH: permisosTH)
    case .notificaciones:
        EmptyView()
    case let .solicitudesListScreen(solicitudes, tipoSolicitud):
        MisSolicitudesScreen(solicitudes: solicitudes, tipoSolicitud: tipoSolicitud)
    case .beneficiosLista:
        BeneficiosScreen()
    }
}


