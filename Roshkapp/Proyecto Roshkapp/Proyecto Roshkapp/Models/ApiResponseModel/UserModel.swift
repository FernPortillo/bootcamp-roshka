//
//  UserModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation

struct UserModel : Codable
{
    let idUsuario: Int
    let nombre : String
    let apellido: String
    let nroCedula: String?
    let correo: String?
    let rol : RolModel
    let fechaIngreso: String?
    let antiguedad: String?
    let diasVacaciones : Int?
    let estado: String? // Capaz cambiar mas adelante a un modelo propio
    let telefono: String?
    let cargo: CargoModel?
    let fechaNacimiento: String?
    let diasVacacionesRestante: Int?
    let foco : String?
    let urlPerfil : String?
    let disponibilidad: Int?
    let equipos : [EquipoModel]?
    
    static var mockUser = UserModel(
        idUsuario: 1,
        nombre: "Fu",
        apellido: "Barrios",
        nroCedula: "12345678",
        correo: "fu.barrios@example.com",
        rol: RolModel(
            idRol: 2,
            nombre: "Administrador"
        ),
        fechaIngreso: "2023-05-10",
        antiguedad: "2 años",
        diasVacaciones: 15,
        estado: "Activo",
        telefono: "099123456",
        cargo: CargoModel(
            idCargo: 1,
            nombre: "Desarrollador iOS"
        ),
        fechaNacimiento: "1998-11-20",
        diasVacacionesRestante: 8,
        foco: "Desarrollo móvil",
        urlPerfil: "https://example.com/perfiles/fu.jpg",
        disponibilidad: 100,
        equipos: []
    )
}

// Para probar frpm@gmail.com



