//
//  ContentView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-02.
//
import SwiftUI

struct AppRootView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var userPrefs: UserPreferences

    let repositoryFactory: RepositoryFactory

    var body: some View {
        if appState.isAuthenticated {
            AuthenticatedView(repositoryFactory: repositoryFactory)
        } else {
            if userPrefs.rememberMe && !userPrefs.savedEmail.isEmpty {
                LoginRecordado(
                    loginVM: LoginViewModel(loginUseCase: repositoryFactory.loginUsecase))
            }
            else {
                NonAuthenticatedView(loginUC: repositoryFactory.loginUsecase)
            }
        }
    }
}



