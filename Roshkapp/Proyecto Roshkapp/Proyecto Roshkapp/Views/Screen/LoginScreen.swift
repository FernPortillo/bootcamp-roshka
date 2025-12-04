//
//  LoginScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct LoginScreen: View {

    @StateObject var loginVM: LoginViewModel
    @State var isRememberMeChecked : Bool = false
    var body: some View {
        
        //TODO: No hardcodear y hacer funcionar el RECUERDAME
        VStack {
            Spacer(minLength: 150)
            
            Image("LogoRoshka")
                .padding(.bottom, Spacing.l)
            
            VStack(alignment: .leading){
                LoginMailField(inputText: $loginVM.loginInput,
                               fieldText: "Ingresa tu correo")
                    .padding(.vertical, Spacing.s)
                
                CustomPassField(inputText: $loginVM.passwordInput,
                                fieldText: "Ingresa tu Contraseña")
                    .padding(.vertical, Spacing.s)
                
                CustomCheckbox(isChecked: isRememberMeChecked, textoCheckBox: "Recuerdame")
                    .padding(.leading, Spacing.s)
                    .padding(.vertical, Spacing.xs)
                
                IconButton(buttonText: "Iniciar Sesion",
                           iconName: "login.icon")
                    {
                        Task {
                            await loginVM.login()
                        }
                    }
                    .padding(.vertical, Spacing.s)
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(Spacing.m)
    }
}

#Preview {
    LoginScreen(loginVM: LoginViewModel.mock())
}
