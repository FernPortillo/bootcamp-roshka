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
    let photosRepository : ProfilePicRepositoryImplementation
    let appService: AppService
    let loginUC: LoginUsecase
    let test : Bool = false
    
    var body: some View {
        if appState.isAuthenticated
        {
            AuthenticatedView(keychainManager: keychainManager,
                              userRepository: userRepository,
                              novedadesRepository: novedadesRepository,
                              photosRepository: photosRepository,
                              appState: appState)
        }
        else {
            // Crear LoginViewModel aca, dentro del body
            if test {
                ProfileScreen(user: UserModel.mockUser)
            }
            else
            {
                NonAuthenticatedView(loginUC: loginUC, appState: appState)
            }
        }
    }
}


struct AuthenticatedView: View {
    @StateObject private var userVM: UserViewModel
    @StateObject private var novedadesVM: NovedadesViewModel
    @StateObject private var photosVM : ProfilePicViewModel
    let appState : AppState
    
    init(
        keychainManager: KeychainManager,
        userRepository: UserRepositoryImplementation,
        novedadesRepository: NovedadesRepositoryImplementation,
        photosRepository: ProfilePicRepositoryImplementation,
        appState: AppState
    ) {
        let userUC = UserUsecase(keychain: keychainManager, userRepository: userRepository, appState: appState)
        _userVM = StateObject(wrappedValue: UserViewModel(userUC: userUC))
        
        let novedadesUC = NovedadesUsecase(keychain: keychainManager, novedadesRepository: novedadesRepository)
        _novedadesVM = StateObject(wrappedValue: NovedadesViewModel(novedadesUsecase: novedadesUC))
        
        let photosUC = ProfilePicUseCase(keychain: keychainManager, appState: appState, newProfilePictureRepository: photosRepository)
        _photosVM = StateObject(wrappedValue: ProfilePicViewModel(profilePicUsecase: photosUC))
        
        self.appState = appState
    }
    
    var body: some View {
        MainScreen(userVM: userVM, novedadesVM: novedadesVM, appState: appState)
            .environmentObject(photosVM)
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
