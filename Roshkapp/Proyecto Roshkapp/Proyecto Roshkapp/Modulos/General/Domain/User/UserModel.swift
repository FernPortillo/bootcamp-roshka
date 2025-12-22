//
//  UserModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation

struct UserModel : Codable, Hashable, Identifiable
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
    let estado: String? 
    let telefono: String?
    let cargo: CargoModel?
    let fechaNacimiento: String?
    let diasVacacionesRestante: Int?
    let foco : String?
    var urlPerfil : String?
    let disponibilidad: Int?
    let equipos : [DispositivoModel]?
    
    
    var id: Int { idUsuario }
    
    // Para que el hashable funcione
    // Hace que el equatable compare la novedad de la izq( LHS ) con el de la der ( RHS )
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        lhs.idUsuario == rhs.idUsuario
        
    }
        
    // Genera el hash para el Modelo
    func hash(into hasher: inout Hasher) {
        hasher.combine(idUsuario)
    }
    
    static var mockUser = UserModel(
        idUsuario: 1,
        nombre: "Funci",
        apellido: "Onario",
        nroCedula: "12345678",
        correo: "funci.onario@roshka.com",
        rol: RolModel(
            idRol: 2,
            nombre: "OPERACIONES"
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
        equipos: DispositivoModel.mockDispositivos
    )
    
    static var mockUser2 = UserModel(
        idUsuario: 3,
        nombre: "Fulano",
        apellido: "De Tal",
        nroCedula: "45678912",
        correo: "fulanito@roshka.com",
        rol: RolModel(
            idRol: 1,
            nombre: "TALENTO HUMANO"
        ),
        fechaIngreso: "2019-08-01",
        antiguedad: "5 años",
        diasVacaciones: 25,
        estado: "Activo",
        telefono: "097112233",
        cargo: CargoModel(
            idCargo: 3,
            nombre: "Tech Lead"
        ),
        fechaNacimiento: "1990-02-14",
        diasVacacionesRestante: 18,
        foco: "Gestión de equipos",
        urlPerfil: "",
        disponibilidad: 70,
        equipos: DispositivoModel.mockDispositivos
    )
}

// Para probar frpm@gmail.com




extension UserModel{
    static func getNombreUsuario(usuario: UserModel) -> String {
        return ("\(usuario.nombre) \(usuario.apellido)")
    }
}


struct Antiguedad {
    let years: Int
    let months: Int
    let days: Int
}

extension UserModel {
    var antiguedadCalculada: Antiguedad {
        guard
            let fechaIngreso,
            let startDate = fechaIngreso.toDate()
        else {
            return Antiguedad(years: 0, months: 0, days: 0)
        }

        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.year, .month, .day],
            from: startDate,
            to: Date()
        )

        return Antiguedad(
            years: components.year ?? 0,
            months: components.month ?? 0,
            days: components.day ?? 0
        )
    }
}

extension String{
    func toDate(format: String = "yyyy-MM-dd") -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: self)
    }
}
