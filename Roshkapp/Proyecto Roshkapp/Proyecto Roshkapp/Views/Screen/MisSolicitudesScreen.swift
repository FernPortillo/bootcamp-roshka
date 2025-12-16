//
//  MisSolicitudesScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct MisSolicitudesScreen: View {
    let solicitudes : [SolicitudesResponseModel]
    @State private var tipoFiltro : TipoSolicitudIterable = .todos
    var body: some View {
        let beneficios = solicitudes.filter { $0.tipoSolicitud == TipoSolicitudIterable.beneficio.rawValue }
        let permisos = solicitudes.filter { $0.tipoSolicitud == TipoSolicitudIterable.permiso.rawValue }
        let vacaciones = solicitudes.filter { $0.tipoSolicitud == TipoSolicitudIterable.vacaciones.rawValue }
        let dispositivo = solicitudes.filter { $0.tipoSolicitud == TipoSolicitudIterable.dispositivo.rawValue }
        

        let filter : [SolicitudesResponseModel] =
        {
            switch tipoFiltro {
            case .beneficio:
                beneficios
            case .permiso:
                permisos
            case .vacaciones:
                vacaciones
            case .dispositivo:
                dispositivo
            case .todos:
                solicitudes
            }
        }()
        
        ScrollView{
            Text("Solicitudes")
            VStack{
                Text("Filtrar por: ")
                Picker("Filtrar por", selection: $tipoFiltro)
                {
                    ForEach(TipoSolicitudIterable.allCases) { tipo in
                        Text(tipo.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .labelsHidden()
            }

            ListaSolicitudes(solicitudes: filter)
        }

    }
}

#Preview {
    @Previewable var pvm = ProfilePicViewModel.mock()
    let solicitudes = SolicitudesResponseModel.solicitudesMock
    MisSolicitudesScreen(solicitudes: solicitudes)
        .environmentObject(pvm)
}

enum TipoSolicitudIterable: String, CaseIterable, Identifiable {
    case todos = "TODOS"
    case beneficio = "BENEFICIO"
    case permiso = "PERMISO"
    case vacaciones = "VACACIONES"
    case dispositivo = "DISPOSITIVO"
    var id: Self { self }
}
