//
//  VacacionesPerfil.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//

import SwiftUI

struct VacacionesPerfil: View {
    let diasVacacionesUser : Int?
    let diasRestantesUser: Int?
    var body: some View {
        var diasVacaciones: Int {
            diasVacacionesUser ?? 0
        }
        var diasRestantes: Int {
            diasRestantesUser ?? 0
        }
        HStack{
            SquaredComponentWithIcon(iconName: "calendar.badge.plus", textTitle: "Vacaciones:", value: diasVacaciones)
            SquaredComponentWithIcon(iconName: "calendar.badge.minus", textTitle: "Restantes:", value: diasRestantes)
        }
    }
}

#Preview {
    VacacionesPerfil(diasVacacionesUser: 10, diasRestantesUser: 15)
        .withAppColors()
}
