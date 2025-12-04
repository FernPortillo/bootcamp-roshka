//
//  LoginScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var loginViewModel : LoginViewModel
    
    @State var isRememberMeChecked : Bool = false
    var body: some View {
        VStack {
            Spacer(minLength: 150)
            
            Image("LogoRoshka")
                .padding(.bottom, Spacing.l)
            
            VStack(alignment: .leading){
                LoginMailField(inputText: $loginViewModel.loginInput,
                               fieldText: "Ingresa tu correo")
                    .padding(.vertical, Spacing.s)
                
                CustomPassField(inputText: $loginViewModel.passwordInput,
                                fieldText: "Ingresa tu Contraseña")
                    .padding(.vertical, Spacing.s)
                
                CustomCheckbox(isChecked: isRememberMeChecked, textoCheckBox: "Recuerdame")
                    .padding(.leading, Spacing.s)
                    .padding(.vertical, Spacing.xs)
                
                IconButton(buttonText: "Iniciar Sesion",
                           iconName: "login.icon")
                    {
                        Task { await loginViewModel.login() }
                    }
                    .fullScreenCover(isPresented: $loginViewModel.isLoggedIn)
                        {
                            MainScreen()

                        }
                    .padding(.vertical, Spacing.s)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(Spacing.m)
    }
}

/* #Preview {
 LoginScreen()
 }
 */
