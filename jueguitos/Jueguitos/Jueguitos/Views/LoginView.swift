//
//  LoginView.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-26.
//

import SwiftUI

let celeste = Color(red: 0.788, green: 0.914, blue: 0.969)
let blancoOpaco = Color(white: 1, opacity: 0.75)

struct LoginView: View {
    @State private var nombreLogin = ""
    @State private var passLogin = ""
    @State private var isPassVisible = false
    var isInputEmpty: Bool {
        [nombreLogin, passLogin].contains(where: \.isEmpty)
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Iniciar Sesion")
            Divider()
                .background(.cyan)
                .frame(width: 200)
            VStack{
                TextField("", text: $nombreLogin,
                          prompt: Text("Usuario").foregroundStyle(blancoOpaco))
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .textFieldStyle(LoginTextFieldStyle())
                    .foregroundStyle(.white)

                Group{
                    if (isPassVisible)
                    {
                        TextField("",
                                  text: $passLogin,
                                  prompt: Text("Password").foregroundStyle(blancoOpaco))
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .keyboardType(.asciiCapable)
                    }
                    else
                    {
                        SecureField("",
                                    text: $passLogin,
                                    prompt: Text("Password").foregroundStyle(blancoOpaco))
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .keyboardType(.asciiCapable)
                            .onSubmit {
                                // OnLoginCheck
                            }
                    }
                }
                .textFieldStyle(PassTextFieldStyle(isPassVisible: $isPassVisible))
                .foregroundStyle(.white)


                .padding(.top, 8)
                    
            }
            .padding()
            Button(action: {print("Login") /* OnLoginCheck */ })
            {
                Text("Login")
                    .padding(.horizontal).padding(.vertical, 8)
                    .tint(Color.white)
            }
            .background(
                !isInputEmpty ?
                LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom) :
                    LinearGradient(colors: [.gray, .gray], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(16)
            
            HStack{
                Text("No tenes una cuenta?")
                Button(action: {/* Go to Register*/})
                {
                    Text("Registrate")
                }
            }
            .padding()
            Spacer()
        }
        .background(
            LinearGradient(colors: [celeste, .white], startPoint: .top, endPoint: .bottom)
        )
    }
}


#Preview {
    LoginView()
}
