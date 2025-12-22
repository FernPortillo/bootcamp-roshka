//
//  BeneficiosScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-21.
//

import SwiftUI

struct BeneficiosScreen: View {
    @Environment(\.appColors) var colors
    @State var expanded : Set<TiposBeneficios> = []
    private func toggle(_ beneficio: TiposBeneficios) {
        if expanded.contains(beneficio) {
            expanded.remove(beneficio)
        } else {
            expanded.insert(beneficio)
        }
    }
    var body: some View {
        VStack{
            Text("Beneficios")
                .font(.boldLarger)
                .foregroundStyle(colors.textColor)
                .padding(.bottom, Spacing.xs)
            Text("Beneficios de la Empresa")
                .font(.blackMedium)
                .foregroundStyle(colors.textColor)
            Divider()
                .padding(.bottom, Spacing.xs)
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(TiposBeneficios.allCases){ beneficio in
                        let isCollapsed = !expanded.contains(beneficio)
                        TituloConIconoColapsable(iconName: beneficio.icon, title: beneficio.rawValue, isCollapsed: !isCollapsed)
                        {
                            toggle(beneficio)
                        }
                        if !isCollapsed{
                            Text(beneficio.descripcion)
                                .font(.regularMedium)
                        }
                    }
                    .padding(.top, Spacing.s)
                    .padding(.horizontal, Spacing.l)
                }
            }
        }
        .padding(.vertical)
        .background(colors.appBackgroundColor)
    }
}

#Preview {
    BeneficiosScreen()
        .withAppColors()
}
