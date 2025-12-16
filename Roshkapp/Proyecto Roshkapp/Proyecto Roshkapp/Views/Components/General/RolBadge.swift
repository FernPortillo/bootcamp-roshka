//
//  RolBadge.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct RolBadge: View {
    let rol : RolModel
    var body: some View {
        let nombre = rol.nombre
        let icono = RolModel.getRoleIcon(nombre)
        HStack{
            Image(systemName: icono)
            Text(nombre)
                .font(.regularSmaller)
        }
        .padding(Spacing.s)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.darkBackgroundColor)
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let rol = RolModel(idRol: 1, nombre: "TEAM LIDER")
    RolBadge(rol: rol)
}
