//
//  SquaredComponentWithIcon.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//DispositivoModel.getDeviceIcon(tipo: dispositivo.tipoDispositivo)

import SwiftUI

struct SquaredComponentWithIcon: View {
    @Environment(\.appColors) var colors
    let iconName: String
    let textTitle: String
    let value: Int
    var body: some View {
        VStack(alignment:.center, spacing: 2){
            Image(systemName: iconName)
                .foregroundStyle(colors.altTextColor)
                .padding()
                .background(
                    Circle()
                        .foregroundStyle(colors.mainColor)
                )
            Text(textTitle)
                .font(.regularSmall)
                .foregroundStyle(colors.textColor)

            Text("\(value) dias")
                .font(.boldMedium)
                .foregroundStyle(colors.textColor)
            
        }
            .frame(width: 180, height: 150)
            .background(
                RoundedRectangle(cornerRadius: Spacing.m)
                    .foregroundStyle(colors.darkBackgroundColor)
            )
    }
}

struct SquaredComponentWithIconNoValue: View {
    @Environment(\.appColors) var colors
    let iconName: String
    let textTitle: String
    var body: some View {
        VStack(alignment:.center, spacing: 2){
            Image(iconName)
                .foregroundStyle(colors.altTextColor)
                .padding()
                .background(
                    Circle()
                        .foregroundStyle(colors.mainColor)
                )
            Text(textTitle)
                .font(.boldBody)
                .lineLimit(1)
                .foregroundStyle(colors.textColor)
                
        }
            .frame(width: 180, height: 150)
            .background(
                RoundedRectangle(cornerRadius: Spacing.m)
                    .foregroundStyle(colors.darkBackgroundColor)
            )
    }
}

#Preview {
    SquaredComponentWithIcon(iconName: "house", textTitle: "Placeholder", value: 1)
    .withAppColors()
}
