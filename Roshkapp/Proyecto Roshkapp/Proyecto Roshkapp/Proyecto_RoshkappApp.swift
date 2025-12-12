//
//  Proyecto_RoshkappApp.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-02.
//
import SwiftUI

@main
struct Proyecto_RoshkappApp: App {
    @StateObject private var appState: AppState = AppState()
    @StateObject private var keychainManager = KeychainManager.shared
    
    private let appService = AppService()
    private let loginUC: LoginUsecase
    private let authRepository: AuthRepositoryImplementation
    private let userRepository: UserRepositoryImplementation
    private let novedadesRepository : NovedadesRepositoryImplementation
    private let photosRepository: ProfilePicRepositoryImplementation
    
    init() {
        self.authRepository = AuthRepositoryImplementation(appService: appService)
        self.userRepository = UserRepositoryImplementation(appService: appService)
        self.loginUC = LoginUsecase(keychain: KeychainManager.shared, authRepository: authRepository)
        self.novedadesRepository = NovedadesRepositoryImplementation(appService: appService)
        self.photosRepository = ProfilePicRepositoryImplementation(appService: appService)
    }
    
    var body: some Scene {
        WindowGroup {
            AppRootView(
                userRepository: userRepository,
                authRepository: authRepository,
                novedadesRepository: novedadesRepository,
                photosRepository: photosRepository,
                appService: appService,
                loginUC: loginUC,
            )
            .preferredColorScheme(.light)
            .environmentObject(keychainManager)
            .environmentObject(appState)
        }
    }
}
