//
//  SolicitudesResponse.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//

struct SolicitudesResponseModel : Codable {
    let idSolicitud: Int
    let idUsuario: Int?
    let nombreUsuario: String?
    let usuario: String?
    let tipoSolicitud: String
    let subTipo: String?
    let comentario: String?
    let estado: String
    let fechaInicio: String
    let fechaFin: String?
    let cantidadDias: Int?
    let fechaCreacion: String?
    let confirmacionTh: Bool?
     
    var nombreCompleto: String {
         nombreUsuario ?? usuario ?? "Usuario desconocido"
     }
     
    var tipo: TipoSolicitud {
         TipoSolicitud(rawValue: tipoSolicitud) ?? .otro
    }
 }

 enum EstadoSolicitud: String {
    case pendiente = "P"
    case aprobado = "A"
    case rechazado = "R"
 }
