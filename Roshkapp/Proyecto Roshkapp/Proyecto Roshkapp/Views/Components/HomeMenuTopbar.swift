//
//  HomeMenuTopbar.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

struct HomeMenuTopbar: View {
    let nombre: String
    var body: some View {
        HStack(alignment: .center){
            UserWelcome(nombre: nombre)
            Spacer()
            Image(systemName: "bell")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(Color.mainColor)
            Image("logout.icon")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(Color.mainColor)
        }
        .padding(Spacing.xs)
    }
}


#Preview {
    HomeMenuTopbar(nombre: "Funcionario")
}
