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
    let novedadesRepository: NovedadesRepositoryImplementation
    let appService: AppService
    let loginUC: LoginUsecase
    
    var body: some View {
        if appState.isAuthenticated
        {
            AuthenticatedView(keychainManager: keychainManager,
                              userRepository: userRepository,
                              novedadesRepository: novedadesRepository)
        }
        else {
            // Crear LoginViewModel aca, dentro del body
           NonAuthenticatedView(loginUC: loginUC, appState: appState)
        }
    }
}


struct AuthenticatedView: View {
    @StateObject private var userVM: UserViewModel
    @StateObject private var novedadesVM: NovedadesViewModel
    
    init(
        keychainManager: KeychainManager,
        userRepository: UserRepositoryImplementation,
        novedadesRepository: NovedadesRepositoryImplementation
    ) {
        let userUC = UserUsecase(keychain: keychainManager, userRepository: userRepository)
        _userVM = StateObject(wrappedValue: UserViewModel(userUC: userUC))
        
        let novedadesUC = NovedadesUsecase(keychain: keychainManager, novedadesRepository: novedadesRepository)
        _novedadesVM = StateObject(wrappedValue: NovedadesViewModel(novedadesUsecase: novedadesUC))
    }
    
    var body: some View {
        MainScreen(userVM: userVM, novedadesVM: novedadesVM)
    }
}


struct NonAuthenticatedView: View {
    @StateObject private var loginVM: LoginViewModel
        
        init(loginUC: LoginUsecase, appState: AppState) {
            _loginVM = StateObject(wrappedValue: LoginViewModel(loginUseCase: loginUC, appState: appState))
        }
        
        var body: some View {
            LoginScreen(loginVM: loginVM)
        }
}
