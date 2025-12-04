//
//  UserWithProfilePic.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

/// Modificar a partir de este para cualquier cosa que necesite usuario y perfil a la izq, como las novedades
struct UserWithProfilePic: View {
    let nombreUser : String
    let cargoUser : String
    var body: some View {
        HStack{
            Image("generic.avatar")
            VStack(alignment: .leading){
                Text("Bienvenido \(nombreUser)")
                Text(cargoUser)
            }
        }
        .padding(Spacing.xs)
    }
}

#Preview {
    UserWithProfilePic(nombreUser: "Alguien Fulano", cargoUser: "Desarrollador iOS")
}
