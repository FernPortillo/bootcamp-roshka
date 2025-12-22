//
//  DispositivosSection.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct DispositivosSection: View {
    @Environment(\.appColors) var colors
    @State private var showDispositivosInfo = false
    let dispositivos : [DispositivoModel]
    var body: some View {
        VStack(alignment: .leading){
            TituloConIconoColapsable(
                iconName: "laptopcomputer",
                title: "Dispositivos",
                isCollapsed: showDispositivosInfo)
            {
                showDispositivosInfo.toggle()
            }
            
            if showDispositivosInfo{
                HStack{
                    if dispositivos.isEmpty{
                        Spacer()
                        EmptySectionComponent(
                        mensaje: "Este usuario no posee dispositivos",
                        icon: IconsEnum.cancel.rawValue,
                        systemName: true)
                        Spacer()
                    }
                    
                    else {
                        GridDispositivos(dispositivos: dispositivos)
                    }
                }
            }
        }
        .padding(Spacing.m)
        .background(
            RoundedRectangle(cornerRadius: Spacing.m)
                .foregroundStyle(colors.darkBackgroundColor)
        )
    }
    
}


#Preview {
    DispositivosSection(dispositivos: UserModel.mockUser.equipos!)
        .withAppColors()
}
