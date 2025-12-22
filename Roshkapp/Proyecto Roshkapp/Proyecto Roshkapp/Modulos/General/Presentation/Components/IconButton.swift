//
//  IconButton.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct IconButton: View {
    @Environment(\.appColors) var colors
    let buttonText: String
    let iconName: String
    var systemName = false
    let action: () async -> Void
    var colorTexto : Color?
    var colorFondo: Color?
    var body: some View {
        Button {
            Task {
                await action()
            }
        } label: {
            Spacer()
            HStack {
                Image(named: iconName, system: systemName)
                    .foregroundStyle(colorTexto ?? colors.accentLighter)
                
                Text(buttonText)
                    .font(.blackSmall)
                    .foregroundStyle(colorTexto ?? colors.accentLighter)
            }
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(colorFondo ?? colors.accentColor)
        }
    }
}
#Preview {
    let action = {}
    IconButton(buttonText: "Placeholder", iconName: "login.icon",action: action)
        .withAppColors()
}
