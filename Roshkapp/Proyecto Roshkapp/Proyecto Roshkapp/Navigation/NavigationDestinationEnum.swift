//
//  NavigationDestinationEnum.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import Foundation

enum Destination: Hashable {
    case push(_ destination: PushDestination)
}


enum PushDestination : Hashable{
    case novedadesFullScreen(novedad: NovedadesModel, permisosTH: Bool)
    case profile(user: UserModel, permisosTH: Bool)
    case beneficiosLista
    case solicitudesListScreen(solicitudes: [SolicitudesResponseModel], tipoSolicitud: String)
    case notificaciones
}

