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
     let prioridad: String //MARK: Va a ser booleano despues
     
/*
 let categoria: String
 let prioridad: "ALTA"
 */
     
     
     static var mockNovedad: NovedadesModel{
         return NovedadesModel(
         idNovedades: 1,
         titulo: "Prueba desde Postman",
         descripcion: "Esta es una novedad de prueba",
         imagenUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
         fechaExpiracion: "2025-12-30",
         activo: true,
         prioridad: "ALTA")
     }
     
     static var mockNovedades: [NovedadesModel] {
         return [
             NovedadesModel(
                 idNovedades: 1,
                 titulo: "Prueba desde Postman",
                 descripcion: "Esta es una novedad de prueba",
                 imagenUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpgg",
                 fechaExpiracion: "2025-12-30",
                 activo: true,
                 prioridad: "ALTA"
             ),
             NovedadesModel(
                 idNovedades: 2,
                 titulo: "ROSHKLASICO",
                 descripcion: "El viernes Roshklasico",
                 imagenUrl: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/qG3RYlIVpTYclR9TYIsy8p7m7AT.jpg",
                 fechaExpiracion: "2025-12-31",
                 activo: true,
                 prioridad: "ALTA"
             ),
             NovedadesModel(
                 idNovedades: 3,
                 titulo: "FIESTA FIN DE AÑO!!",
                 descripcion: "Viernes 19/12 estaremos festejando un año más!",
                 imagenUrl: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
                 fechaExpiracion: "2025-12-20",
                 activo: true,
                 prioridad: "MEDIA"
             ),
             NovedadesModel(
                 idNovedades: 4,
                 titulo: "Prueba sin imagen",
                 descripcion: "Esta novedad no tiene imagen",
                 imagenUrl: nil,
                 fechaExpiracion: "2025-12-25",
                 activo: true,
                 prioridad: "ALTA"
             ),
             NovedadesModel(
                 idNovedades: 5,
                 titulo: "Novedad inactiva",
                 descripcion: "Esta novedad está inactiva",
                 imagenUrl: "https://ejemplo.com/banner5.jpg",
                 fechaExpiracion: "2025-12-15",
                 activo: false,
                 prioridad: "BAJA"
             )
         ]
     }
 }



