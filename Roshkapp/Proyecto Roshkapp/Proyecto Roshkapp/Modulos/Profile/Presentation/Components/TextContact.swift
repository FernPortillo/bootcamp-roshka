//
//  TextContact.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//

import SwiftUI

struct TextContact: View {
    let titulo: String
    let value: String
    var body: some View {
        Text(titulo)
            .font(.lightSmall)
        Text(value)
            .font(.regularBody)
    }
}

#Preview {
    TextContact(titulo: "PlaceHolderTitulo", value: "Algun valor")
}
