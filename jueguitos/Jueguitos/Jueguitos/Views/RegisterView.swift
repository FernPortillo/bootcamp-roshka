//
//  RegisterView.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-27.
//

import SwiftUI

struct RegisterView: View {
    @State private var nombreRegistro = ""
    @State private var passRegistro = ""
    @State private var isPassVisible = false
    var isInputEmpty: Bool {
        [nombreRegistro, passRegistro].contains(where: \.isEmpty)
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Button(action: {/* Volver */})
                {
                    Image(systemName: "arrow.left")
                        .padding(.horizontal, 32)
                }
                
                Spacer()
                Text("Registrarse")
                Spacer()
                Spacer()
            }
            
            Divider()
                .background(.cyan)
                .frame(width: 200)
            VStack{
                TextField("", text: $nombreRegistro,
                          prompt: Text("Usuario").foregroundStyle(blancoOpaco))
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .textFieldStyle(LoginTextFieldStyle())
                    .foregroundStyle(.white)

                Group{
                    if (isPassVisible)
                    {
                        TextField("",
                                  text: $passRegistro,
                                  prompt: Text("Password").foregroundStyle(blancoOpaco))
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .keyboardType(.asciiCapable)
                    }
                    else
                    {
                        SecureField("",
                                    text: $passRegistro,
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
            Button(action: {print("Registrarse") /* OnRegistroCheck */ })
            {
                Text("Registrarse")
                    .padding(.horizontal).padding(.vertical, 8)
                    .tint(Color.white)
            }
            .background(
                !isInputEmpty ?
                LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom) :
                    LinearGradient(colors: [.gray, .gray], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(16)
            Spacer()
        }
        .background(
            LinearGradient(colors: [celeste, .white], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    RegisterView()
}
