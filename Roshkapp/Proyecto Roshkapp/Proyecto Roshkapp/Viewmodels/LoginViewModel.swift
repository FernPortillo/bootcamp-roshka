//
//  LoginViewModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation
import Combine


final class LoginViewModel : ObservableObject {
    @Published var loginInput : String = ""
    @Published var passwordInput : String = ""
    @Published var errorMessage : String? = ""
    @Published var isLoggedIn : Bool = false
    
    private let loginUseCase : LoginUsecase
    
    init(loginUseCase: LoginUsecase) {
        self.loginUseCase = loginUseCase
    }
    
    
    func login() async {
        
        let request = LoginRequest(
            correo: loginInput,
            contrasena: passwordInput)
        
        do {
            let _ = try await loginUseCase.executeLogin(request: request)
            
            await MainActor.run
            {
                isLoggedIn = true
            }
        }
        catch {
            await MainActor.run {
                print("Error de Login")
            }
        }
    }
}
