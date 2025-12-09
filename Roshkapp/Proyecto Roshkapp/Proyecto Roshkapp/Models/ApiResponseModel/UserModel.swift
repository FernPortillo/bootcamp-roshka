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
    let nroCedula: String
    let correo: String
    let rol : RolModel
    let fechaIngreso: String
    let antiguedad: String
    let diasVacaciones : Int
    let estado: String // Capaz cambiar mas adelante a un modelo propio
    let telefono: String
    let cargo: CargoModel
    let fechaNacimiento: String
    let diasVacacionesRestante: Int
    let foco : String
    let urlPerfil : String?
    let disponibilidad: Int
    let equipos : [EquipoModel]
}

// Para probar frpm@gmail.com



