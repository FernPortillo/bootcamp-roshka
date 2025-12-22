//
//  RolBadge.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct RolBadge: View {
    @Environment(\.appColors) var colors
    let rol : RolModel
    let antiguedadColorBG: Color
    let letraAntiguedadColor: Color
    var body: some View {
        let nombre = rol.nombre
        let icono = RolModel.getRoleIcon(nombre)
        HStack{
            Image(systemName: icono)
                .foregroundStyle(letraAntiguedadColor)
            Text(nombre)
                .font(.regularSmaller)
                .foregroundStyle(letraAntiguedadColor)
        }
        .padding(Spacing.s)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(antiguedadColorBG)
        )
    }
}

#Preview {
    @Previewable var colors = AppColorsKey.defaultValue
    RolBadge(rol: RolModel(idRol: 1, nombre: "OPERACIONES"),
             antiguedadColorBG: colors.approvedBackgroundColor,
             letraAntiguedadColor: colors.approvedTextColor)
        .withAppColors()
}

