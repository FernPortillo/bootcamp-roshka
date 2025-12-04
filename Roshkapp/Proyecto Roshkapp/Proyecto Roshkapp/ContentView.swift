//
//  ContentView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let appService = AppService()
        let authRepository = AuthRepositoryImplementation(appService: appService)
        let loginUC = LoginUsecase(authRepository: authRepository)
        let loginVM = LoginViewModel(loginUseCase: loginUC)
        LoginScreen(loginViewModel: loginVM)
    }
}

#Preview {
    ContentView()
}
