//
//  LoginScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct LoginRecordado: View {
    @Environment(\.appColors) var colors
    @EnvironmentObject var appState: AppState
    @StateObject var loginVM: LoginViewModel
    @StateObject private var userPrefs = UserPreferences.shared
        
    var body: some View {
        VStack {
            Spacer(minLength: 150)
            
            Image("LogoRoshka")
                .padding(.bottom, Spacing.l)
            
            VStack(alignment: .leading) {
                Text("Bienvenido de vuelta")
                    .font(.boldLarge)
                    .padding(.bottom, Spacing.s)
                
                HStack {
                    Spacer()
                    VStack(alignment: .center, spacing: Spacing.m) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(colors.mainColor)
                            .onTapGesture {
                                appState.isAuthenticated = true
                            }
                        
                        Text(userPrefs.savedEmail)
                            .font(.regularBody)
                            .foregroundColor(colors.textColor)
                    }
                    Spacer()
                }
                .padding(.vertical, Spacing.l)
                
                
                IconButton(
                    buttonText: "Iniciar sesión con otro usuario",
                    iconName: "person.fill",
                    systemName: true,
                    action: {
                        loginVM.limpiarRecuerdame()
                        
                    },
                    colorTexto: colors.mainColor,
                    colorFondo: .clear
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(colors.mainColor, lineWidth: 1)
                )
                .padding(.vertical, Spacing.s)
                
                if case .loading = loginVM.state {
                    HStack {
                        Spacer()
                        ProgressView()
                            .scaleEffect(1.2)
                        Spacer()
                    }
                    .padding()
                }
                
                if case .failed(let error) = loginVM.state {
                    errorView(error)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(Spacing.m)
        .background(colors.colorBackgroundLogin)
    }
    
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
}

#Preview {
    let p = ProfilePicViewModel.mock()
    let a = AppState.mockNotAuthenticated()
    LoginRecordado(loginVM: LoginViewModel.mock())
        .withAppColors()
        .environmentObject(a)
        .environmentObject(p)
}
