//
//  ProfileSection.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct ContactoSection: View {
    @Environment(\.appColors) var colors
    @State private var showContactInfo = false
    let correo: String
    let telefono: String
    var body: some View {
        VStack(alignment: .leading){
            TituloConIconoColapsable(
                iconName: "person.text.rectangle",
                title: "Contacto",
                isCollapsed: showContactInfo)
            {
                showContactInfo.toggle()
            }
            if showContactInfo{
                Divider()
                TextContact(titulo: "Correo", value: correo)
                    .padding(.bottom, Spacing.xs)
                TextContact(titulo: "Telefono", value: telefono)
                    .padding(.bottom, Spacing.xs)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: Spacing.m)
                .foregroundStyle(colors.darkBackgroundColor)
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContactoSection(correo: "aa@roshka.com", telefono: "09999999")
        .withAppColors()
}

