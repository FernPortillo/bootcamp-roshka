//
//  SolicitudesResponse.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-08.
//
struct SolicitudesResponseModel: Codable, Hashable, Identifiable {
    let idSolicitud: Int
    let idUsuario: Int?  // No viene en el JSON de TH
    let idDocumentoAdjunto: Int?  // No viene en el JSON de TH
    let idLider: Int?  // No viene en el JSON de TH
    let nombreUsuario: String
    let fechaInicio: String
    let fechaFin: String?  // No viene en el JSON de TH
    let cantDias: Int?
    let comentario: String?  // No viene en el JSON de TH
    let tipoSolicitud: String
    let estado: String
    let fechaCreacion: String
    let nombreLider: String?  // No viene en el JSON de TH
    let nombreSubTipoSolicitud: String?
    let confirmacionTh: Bool
    
    var id: Int { idSolicitud }
    
    enum CodingKeys: String, CodingKey {
        case idSolicitud
        case idUsuario
        case idDocumentoAdjunto
        case idLider
        case nombreUsuario = "usuario"
        case fechaInicio
        case fechaFin
        case cantDias = "cantidadDias"
        case comentario
        case tipoSolicitud
        case estado
        case fechaCreacion
        case nombreLider
        case nombreSubTipoSolicitud = "subTipo"
        case confirmacionTh
    }
    
    // Custom init para manejar valores opcionales del JSON de TH
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idSolicitud = try container.decode(Int.self, forKey: .idSolicitud)
        idUsuario = try? container.decode(Int.self, forKey: .idUsuario)
        idDocumentoAdjunto = try? container.decode(Int.self, forKey: .idDocumentoAdjunto)
        idLider = try? container.decode(Int.self, forKey: .idLider)
        nombreUsuario = try container.decode(String.self, forKey: .nombreUsuario)
        fechaInicio = try container.decode(String.self, forKey: .fechaInicio)
        fechaFin = try? container.decode(String.self, forKey: .fechaFin)
        cantDias = try? container.decode(Int.self, forKey: .cantDias)
        comentario = try? container.decode(String.self, forKey: .comentario)
        tipoSolicitud = try container.decode(String.self, forKey: .tipoSolicitud)
        estado = try container.decode(String.self, forKey: .estado)
        fechaCreacion = try container.decode(String.self, forKey: .fechaCreacion)
        nombreLider = try? container.decode(String.self, forKey: .nombreLider)
        nombreSubTipoSolicitud = try? container.decode(String.self, forKey: .nombreSubTipoSolicitud)
        confirmacionTh = (try? container.decode(Bool.self, forKey: .confirmacionTh)) ?? false
    }
    
    // Init manual para usar en código
    init(idSolicitud: Int, idUsuario: Int?, idDocumentoAdjunto: Int?, idLider: Int?,
         nombreUsuario: String, fechaInicio: String, fechaFin: String?, cantDias: Int?,
         comentario: String?, tipoSolicitud: String, estado: String, fechaCreacion: String,
         nombreLider: String?, nombreSubTipoSolicitud: String?, confirmacionTh: Bool) {
        self.idSolicitud = idSolicitud
        self.idUsuario = idUsuario
        self.idDocumentoAdjunto = idDocumentoAdjunto
        self.idLider = idLider
        self.nombreUsuario = nombreUsuario
        self.fechaInicio = fechaInicio
        self.fechaFin = fechaFin
        self.cantDias = cantDias
        self.comentario = comentario
        self.tipoSolicitud = tipoSolicitud
        self.estado = estado
        self.fechaCreacion = fechaCreacion
        self.nombreLider = nombreLider
        self.nombreSubTipoSolicitud = nombreSubTipoSolicitud
        self.confirmacionTh = confirmacionTh
    }
    
    static func == (lhs: SolicitudesResponseModel, rhs: SolicitudesResponseModel) -> Bool {
        lhs.idSolicitud == rhs.idSolicitud
    }
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(idSolicitud)
    }
    
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
        nombreSubTipoSolicitud: "Permiso por estudios",
        confirmacionTh: false
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
            nombreSubTipoSolicitud: "Permiso por estudios",
            confirmacionTh: false

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
            estado: "R",
            fechaCreacion: "2025-12-12T15:16:03.391847",
            nombreLider: nil,
            nombreSubTipoSolicitud: nil,
            confirmacionTh: false

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
            nombreSubTipoSolicitud: "Mouse",
            confirmacionTh: false

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
            nombreSubTipoSolicitud: "Capacitaciones",
            confirmacionTh: false
        )
    ]
}

import Foundation
extension String {
    func toReadableDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = inputFormatter.date(from: self) else {
            return self
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd 'de' MMMM"
        outputFormatter.locale = Locale(identifier: "es_ES")
        
        return outputFormatter.string(from: date)
    }
}
