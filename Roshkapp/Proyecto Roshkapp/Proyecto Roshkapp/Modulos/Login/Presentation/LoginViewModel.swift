//
//  LoginViewModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import Foundation
import SwiftUI
import Combine


final class LoginViewModel : ObservableObject {
    @Published var loginInput : String = ""
    @Published var passwordInput : String = ""
    @Published var loginError : LoginError?
    @Published var saveCredentialsForBiometrics : Bool = false
    @Published var state : LoadingState<LoginResponse> = .idle
    @Published var isLoginSuccesful = false

    private let loginUseCase : LoginUsecase

    
    init(loginUseCase: LoginUsecase) {
        self.loginUseCase = loginUseCase
    }
    
    //MARK: Login Normal
    func login() async throws{
        
        let request = LoginRequest(
            correo: loginInput,
            contrasena: passwordInput)
        
        guard !request.correo.isEmpty else {
            throw LoginError.emptyCorreo
        }
        
        guard !request.contrasena.isEmpty else {
            throw LoginError.emptyPassword
        }
        
        state = .loading
        
        do{
            let response = try await loginUseCase.executeLogin(request: request)
            
            saveTokens(response)
            state = .loaded(response)
            isLoginSuccesful = true
            
        }
        catch{
            state = .failed(error)
            isLoginSuccesful = false
        }
    }
    
  
    //MARK: Helpers
    func limpiarRecuerdame() {
        loginUseCase.clearRememberMe()
    }
    
    func saveRememberMe(email: String, pass: String, remember : Bool){
        loginUseCase.saveRememberMe(email: email, pass: pass, remember: remember)
    }
    
    func saveTokens(_ response: LoginResponse) {
        loginUseCase.saveToken(token: response.token)
    }
    
    func clearToken() {
        loginUseCase.clearToken()
    }
    
    func logout(mantenerRecuerdame : Bool = false){
        loginUseCase.logout(mantenerRecuerdame: mantenerRecuerdame)
    }
}


enum LoginError: LocalizedError {
    case invalidCredentials
    case emptyCorreo
    case emptyPassword
    case networkError
    case unknown
    case biometriaNoDisponible
    case biometriaCancelada
    case credencialesNoEncontradas
    case biometriaFallida
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Usuario o contraseña incorrectos"
        case .emptyCorreo:
            return "Correo vacío"
        case .emptyPassword:
            return "Contraseña vacía"
        case .networkError:
            return "No se pudo conectar al servidor"
        case .unknown:
            return "Error desconocido"
        case .biometriaNoDisponible:
            return "Biometría no disponible en este dispositivo"
        case .biometriaCancelada:
            return "Autenticación cancelada"
        case .credencialesNoEncontradas:
            return "No se encontraron credenciales guardadas"
        case .biometriaFallida:
            return "Error al autenticar con biometría"
        }
    }
}

