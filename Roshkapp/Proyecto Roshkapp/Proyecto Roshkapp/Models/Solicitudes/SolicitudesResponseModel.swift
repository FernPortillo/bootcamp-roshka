//
//  SolicitudesResponse.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//

struct SolicitudesResponseModel : Codable {
    let idSolicitud: Int
    let idUsuario: Int
    let idDocumentoAdjunto: Int?
    let idLider: Int?
    let nombreUsuario: String
    let fechaInicio: String
    let fechaFin: String?
    let cantDias: Int?
    let comentario: String
    let tipoSolicitud: String
    let estado: String
    let fechaCreacion: String
    let nombreLider: String?
    let nombreSubTipoSolicitud: String?
    

    static let mockSolicitud = SolicitudesResponseModel(
        idSolicitud: 10,
        idUsuario: 19,
        idDocumentoAdjunto: nil,
        idLider: nil,
        nombreUsuario: "Pedro Lopez",
        fechaInicio: "2025-09-27",
        fechaFin: "2025-09-29",
        cantDias: 3,
        comentario: "Permiso por rendir examen parcial",
        tipoSolicitud: "PERMISO",
        estado: "P",
        fechaCreacion: "2025-12-12T15:15:03.684118",
        nombreLider: nil,
        nombreSubTipoSolicitud: "Permiso por estudios"
        )
    
    static let solicitudesMock : [SolicitudesResponseModel] = [
        SolicitudesResponseModel(
            idSolicitud: 10,
            idUsuario: 19,
            idDocumentoAdjunto: nil,
            idLider: nil,
            nombreUsuario: "Pedro Lopez",
            fechaInicio: "2025-09-27",
            fechaFin: "2025-09-29",
            cantDias: 3,
            comentario: "Permiso por rendir examen parcial",
            tipoSolicitud: "PERMISO",
            estado: "P",
            fechaCreacion: "2025-12-12T15:15:03.684118",
            nombreLider: nil,
            nombreSubTipoSolicitud: "Permiso por estudios"
        ),
        SolicitudesResponseModel(
            idSolicitud: 11,
            idUsuario: 19,
            idDocumentoAdjunto: nil,
            idLider: nil,
            nombreUsuario: "Pedro Lopez",
            fechaInicio: "2025-09-27",
            fechaFin: "2025-09-29",
            cantDias: 3,
            comentario: "Permiso por rendir examen parcial",
            tipoSolicitud: "BENEFICIO",
            estado: "P",
            fechaCreacion: "2025-12-12T15:16:03.391847",
            nombreLider: nil,
            nombreSubTipoSolicitud: nil
        ),
        SolicitudesResponseModel(
            idSolicitud: 12,
            idUsuario: 19,
            idDocumentoAdjunto: nil,
            idLider: nil,
            nombreUsuario: "Pedro Lopez",
            fechaInicio: "2025-12-12",
            fechaFin: nil,
            cantDias: nil,
            comentario: "Mi mouse se rompio",
            tipoSolicitud: "DISPOSITIVO",
            estado: "P",
            fechaCreacion: "2025-12-12T15:25:45.990846",
            nombreLider: nil,
            nombreSubTipoSolicitud: "Mouse"
        ),
        SolicitudesResponseModel(
            idSolicitud: 13,
            idUsuario: 19,
            idDocumentoAdjunto: nil,
            idLider: nil,
            nombreUsuario: "Pedro Lopez",
            fechaInicio: "2025-12-15",
            fechaFin: nil,
            cantDias: nil,
            comentario: "Capacitacion Angular",
            tipoSolicitud: "BENEFICIO",
            estado: "A",
            fechaCreacion: "2025-12-13T11:18:48.796194",
            nombreLider: nil,
            nombreSubTipoSolicitud: "Capacitaciones"
        )
    ]
}

