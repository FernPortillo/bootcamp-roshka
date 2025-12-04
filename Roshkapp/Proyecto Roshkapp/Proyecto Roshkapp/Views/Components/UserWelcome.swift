//
//  UserWelcom.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

// Imagen deberia ser clicable
struct UserWelcome: View {
    let nombre: String
    var body: some View {
        VStack(alignment: .leading){
            Image("generic.avatar")
                .onTapGesture {
                    print("Ir al perfil")
                }
            Text("Bienvenido! \(nombre)")
        }
    }
}

#Preview {
    UserWelcome(nombre: "Funcionario")
}
