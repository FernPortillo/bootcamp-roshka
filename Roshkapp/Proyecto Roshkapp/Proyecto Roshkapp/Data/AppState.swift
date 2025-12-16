    //
//  AppState.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//


import Combine
class AppState: ObservableObject {
    //TODO: Manejar current user y errores desde aca
    @Published var isAuthenticated : Bool = false
    @Published var myUser : UserModel = UserModel.mockUser
    
    func checkMyUser(user:UserModel) -> Bool{
        return user.idUsuario == myUser.idUsuario
    }
}
