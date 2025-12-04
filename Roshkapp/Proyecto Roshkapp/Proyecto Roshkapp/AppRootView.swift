//
//  ContentView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-02.
//
import SwiftUI

struct AppRootView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var keychainManager: KeychainManager
    
    // Propiedades inyectadas
    let userRepository: UserRepositoryImplementation
    let authRepository: AuthRepositoryImplementation
    let appService: AppService
    let loginUC: LoginUsecase
    
    var body: some View {
        if appState.isAuthenticated {
            let userUC = UserUsecase(keychain: keychainManager, userRepository: userRepository)
            let userVM = UserViewModel(userUC: userUC)
            HomeScreen(userVM: userVM)
        } else {
            // Crear LoginViewModel aquí, dentro del body
            let loginVM = LoginViewModel(loginUseCase: loginUC, appState: appState)
            LoginScreen(loginVM: loginVM)
        }
    }
}
