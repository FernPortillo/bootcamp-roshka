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
    
    static var mockNovedad: NovedadesModel{
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
}


     


