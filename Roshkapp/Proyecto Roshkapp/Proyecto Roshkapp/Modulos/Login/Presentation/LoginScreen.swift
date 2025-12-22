//
//  LoginScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct LoginScreen: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var keychain: KeychainManager
    @StateObject var loginVM: LoginViewModel
    @StateObject var userDefaults = UserPreferences.shared
    @State var isRememberMeChecked : Bool = false
    
    var body: some View {
        
        //TODO: No hardcodear y hacer funcionar el RECUERDAME
        VStack {
            Spacer(minLength: 150)
            
            Image("LogoRoshka")
                .padding(.bottom, Spacing.l)
            
            VStack(alignment: .leading){
                CustomTextField(inputText: $loginVM.loginInput,
                               fieldText: "Ingresa tu correo o tu cedula", icon: "person.fill")
                    .padding(.vertical, Spacing.s)
                
                CustomPassField(inputText: $loginVM.passwordInput,
                                fieldText: "Ingresa tu Contraseña")
                    .padding(.vertical, Spacing.s)
                
                CustomCheckbox(isChecked: $isRememberMeChecked, textoCheckBox: "Recuerdame")
                    .padding(.leading, Spacing.s)
                    .padding(.vertical, Spacing.xs)
                
                IconButton(buttonText: "Iniciar Sesion",
                           iconName: "login.icon")
                    {
                        Task {
                            try await loginVM.login()
                        }
                    }
                    .padding(.vertical, Spacing.s)
                
                Spacer()
                
                if case .loading = loginVM.state {
                                    ProgressView()
                                        .scaleEffect(1.2)
                                }
                                
                if case .failed(let error) = loginVM.state {
                    errorView(error)
                    
                }
            }
            .onChange(of: loginVM.isLoginSuccesful){ isLoginSuccesful in
                guard isLoginSuccesful, case .loaded(_) = loginVM.state else { return }
                
                Task{
                    loginVM.saveRememberMe(email: loginVM.loginInput,
                                           pass: loginVM.passwordInput,
                                           remember: isRememberMeChecked)
                    
                    appState.isAuthenticated = true
                }
                
            }
            
            Spacer()
        }
        .padding(Spacing.m)
        .background(colors.colorBackgroundLogin)
        .onAppear{
            if userDefaults.rememberMe && !userDefaults.savedEmail.isEmpty {
                loginVM.loginInput = userDefaults.savedEmail
                isRememberMeChecked = true
            }
        }
    }
}

/// Poppup de error
private func errorView(_ error: Error) -> some View {
    let message: String
    if let loginError = error as? LoginError {
        message = loginError.errorDescription ?? "Ocurrió un error"
    } else {
        message = "Ocurrió un error inesperado"
    }
    
    return HStack(spacing: 8) {
        Image(systemName: "exclamationmark.triangle.fill")
        Text(message)
            .font(.caption)
    }
    .foregroundColor(.red)
    .padding()
    .frame(maxWidth: .infinity)
    .background(Color.red.opacity(0.1))
    .cornerRadius(8)
}

#Preview {
    @Previewable var k = KeychainManager()
    let a = AppState.mockAuthenticated()
    let l = LoginViewModel.mock()
    LoginScreen(loginVM: l)
        .environmentObject(a)
        .environmentObject(k)
        .withAppColors()
    
}
