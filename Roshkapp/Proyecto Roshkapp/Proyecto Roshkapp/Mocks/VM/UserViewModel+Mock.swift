//
//  UserViewModel+Mock.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import Foundation


extension UserViewModel {
    static func mockLoading() -> UserViewModel {
        let vm = UserViewModel(userUC: UserUsecase.mock())
        vm.state = .loading
        return vm
    }
    
    
    static func mockLoaded() -> UserViewModel {
        let vm = UserViewModel(userUC: UserUsecase.mock())
        vm.state = .loaded(UserModel(
            idUsuario: 0,
            nombre: "Alguien",
            apellido: "Fulano",
            nroCedula: "6666666",
            correo: "alguienfulano@roshka.com",
            rol: RolModel(idRol: 1, nombre: "TH"),
            fechaIngreso: "23-12-25",
            antiguedad: "1 mes",
            diasVacaciones: 15,
            estado: "A",
            telefono: "0966666666",
            cargo: CargoModel(idCargo: 1, nombre: "Desarrollador iOS"),
            fechaNacimiento: "05-06-2003",
            diasVacacionesRestante: 15,
            foco: "Que era foco",
            urlPerfil: nil,
            disponibilidad: 100,
            equipos: ["String"]))
        return vm
    }
    
    static func mockError() -> UserViewModel {
            let vm = UserViewModel(userUC: UserUsecase.mock())
            vm.state = .failed(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "No autorizado"]))
            return vm
        }
}
