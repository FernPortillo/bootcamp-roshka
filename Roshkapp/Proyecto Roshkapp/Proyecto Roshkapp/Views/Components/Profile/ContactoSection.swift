//
//  ProfileSection.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct ContactoSection: View {
    let correo: String
    let telefono: String
    var body: some View {
            VStack(alignment: .leading){
                Text("Contacto")
                    .font(.regularLarge)
                ProfileComponentInfo(icon: "envelope", value: correo)
                ProfileComponentInfo(icon: "phone", value: telefono)
            }
    }
}

#Preview {
    ContactoSection(correo: "aa@roshka.com", telefono: "09999999")
}

