//
//  ProyectosSection.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//

import SwiftUI

struct ProyectosSection: View {
    @Environment(\.appColors) var colors
    @State private var showProyectosFull = false
    var body: some View {
        VStack(alignment: .leading){
            TituloConIconoColapsable(iconName: "folder",
                                     title: "Proyectos",
                                     isCollapsed: showProyectosFull)
            {
                showProyectosFull.toggle()
            }
            if showProyectosFull{
                Divider()
                Text("Aca pondria los proyectos si hubiera alguno")
            }
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: Spacing.m)
                .foregroundStyle(colors.darkBackgroundColor)
        )
    }
    
}


#Preview {
    ProyectosSection()
        .withAppColors()
}
