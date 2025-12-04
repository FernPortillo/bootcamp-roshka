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
    
    init() {
        self.authRepository = AuthRepositoryImplementation(appService: appService)
        self.userRepository = UserRepositoryImplementation(appService: appService)
        self.loginUC = LoginUsecase(keychain: KeychainManager.shared, authRepository: authRepository)
    }
    
    var body: some Scene {
        WindowGroup {
            AppRootView(
                userRepository: userRepository,
                authRepository: authRepository,
                appService: appService,
                loginUC: loginUC
            )
            .preferredColorScheme(.light)
            .environmentObject(keychainManager)
            .environmentObject(appState)
        }
    }
}
