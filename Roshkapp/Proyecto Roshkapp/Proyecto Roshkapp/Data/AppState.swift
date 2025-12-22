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
    {
        didSet{
            print("isAuthenticated es \(isAuthenticated)")
        }
    }
    @Published var myUser : UserModel = UserModel.mockUser
    private let loginUC: LoginUsecase
    
    init(loginUC: LoginUsecase) {
        self.loginUC = loginUC
        print("AppState init", ObjectIdentifier(self))
    }
    
    func checkMyUser(user:UserModel) -> Bool{
        return user.idUsuario == myUser.idUsuario
    }
    
    func checkPermisosTH() -> Bool{
        return myUser.rol.idRol == 1
    }
    
    func logout(){
        loginUC.logout(mantenerRecuerdame: false)
        isAuthenticated.toggle()
    }
    
    

    deinit {
        print("AppState deinit", ObjectIdentifier(self))
    }

}
