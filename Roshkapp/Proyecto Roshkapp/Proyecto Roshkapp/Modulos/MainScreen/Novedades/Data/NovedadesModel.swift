//
//  NovedadesModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-05.
//
//TODO:
import Foundation

struct NovedadesModel : Codable, Hashable, Identifiable {
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
    
    var id: Int { idNovedades }
    
    // Para que el hashable funcione
    // Hace que el equatable compare la novedad de la izq( LHS ) con el de la der ( RHS )
    static func == (lhs: NovedadesModel, rhs: NovedadesModel) -> Bool {
        lhs.idNovedades == rhs.idNovedades
        
    }
        
    // Genera el hash para el Modelo
    func hash(into hasher: inout Hasher) {
        hasher.combine(idNovedades)
        
    }
    
    static var mockNovedadConImagen: NovedadesModel{
        return NovedadesModel(
            idNovedades: 1,
            titulo: "Prueba desde Postman",
            descripcion: "Esta es una novedad de prueba",
            imagenUrl: "https://res.cloudinary.com/dcjadfldc/image/upload/v1766153883/fov9v8aonpeviyq8psh6.png",
            fechaExpiracion: "2025-12-30",
            activo: true,
            prioridad: true,
            usuario: UserModel.mockUser)
    }
    
    static var mockCarrusel: [NovedadesModel]{
        return [NovedadesModel(
            idNovedades: 1,
            titulo: "Prueba desde Postman",
            descripcion: "Esta es una novedad de prueba",
            imagenUrl: "1",
            fechaExpiracion: "2025-12-30",
            activo: true,
            prioridad: true,
            usuario: UserModel.mockUser),
               NovedadesModel(
                    idNovedades: 2,
                    titulo: "Otro Test",
                    descripcion: "Bienvenidos a etc",
                    imagenUrl: "2",
                    fechaExpiracion: "2025-12-30",
                    activo: true,
                    prioridad: true,
                    usuario: UserModel.mockUser2)
        
        ]
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
                usuario: UserModel.mockUser2),
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



     

