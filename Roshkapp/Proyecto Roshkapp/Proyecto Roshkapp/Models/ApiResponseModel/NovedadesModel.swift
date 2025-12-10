//
//  NovedadesModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//
//TODO:
import Foundation

struct NovedadesModel : Codable {
    let idNovedades: Int
    let titulo: String
    let descripcion: String
    let imagenUrl: String?
    let fechaExpiracion: String
    let activo: Bool
    let prioridad: Bool
    let usuario : UserModel
    /*
     let categoria: String
     let prioridad: "ALTA"
     */
    
    static var mockNovedadConImagen: NovedadesModel{
        return NovedadesModel(
            idNovedades: 1,
            titulo: "Prueba desde Postman",
            descripcion: "Esta es una novedad de prueba",
            imagenUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
            fechaExpiracion: "2025-12-30",
            activo: true,
            prioridad: true,
            usuario: UserModel.mockUser)
    }
    
    static var mockNovedadText: [NovedadesModel]{
        return [
            NovedadesModel(
            idNovedades: 1,
            titulo: "Prueba desde Postman",
            descripcion: "Esta es una novedad de prueba. Sin Texto",
            imagenUrl: nil,
            fechaExpiracion: "2025-12-30",
            activo: true,
            prioridad: true,
            usuario: UserModel.mockUser),
            NovedadesModel(
                idNovedades: 2,
                titulo: "Recordatorio",
                descripcion: "Llenar el timesheet del Jira",
                imagenUrl: nil,
                fechaExpiracion: "2025-12-31",
                activo: true,
                prioridad: false,
                usuario: UserModel.mockUser),
            NovedadesModel(
                idNovedades: 3,
                titulo: "Hola Roshkeros",
                descripcion: "Queridos compañeros. Queremos recordarles que contamos con lockers disponibles para guardar mochilas y objetos personales. Les pedimos, por favor, que eviten dejarlas en el piso de la oficina, ya que esto nos ayuda a mantener el espacio ordenado y también facilita el trabajo de las chicas de limpieza, de esa manera realizan su trabajo de manera más cómoda y segura.  Agradecemos mucho su colaboración. ¡Gracias!",
                imagenUrl: nil,
                fechaExpiracion: "2026-01-01",
                activo: true,
                prioridad: true,
                usuario: UserModel.mockUser)]
    }
}

extension NovedadesModel{
    static func getNombreNovedad(novedad: NovedadesModel) -> String {
        return ("\(novedad.usuario.nombre) \(novedad.usuario.apellido)")
    }
}


     

