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
    
    private let loginUseCase : LoginUsecase
    private let appState : AppState

    
    init(loginUseCase: LoginUsecase, appState: AppState) {
        self.loginUseCase = loginUseCase
        self.appState = appState
    }
    
    
    func login() async {
        
        let request = LoginRequest(
            correo: loginInput,
            contrasena: passwordInput)
        
        do {
            let response = try await loginUseCase.executeLogin(request: request)
            
            await MainActor.run
            {
                print(response.token)
                appState.isAuthenticated = true
            }
        }
        catch {
            await MainActor.run {
                print("Error de Login")
            }
        }
    }
}
