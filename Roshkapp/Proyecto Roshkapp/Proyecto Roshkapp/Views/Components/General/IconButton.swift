//
//  IconButton.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct IconButton: View {
    let buttonText: String
    let iconName: String
    var systemName = false
    let action: () async -> Void
    
    var body: some View {
        Button {
            Task {
                await action()
            }
        } label: {
            Spacer()
            HStack {
                Image(named: iconName, system: systemName)
                    .tint(.accentLighter)
                
                Text(buttonText)
                    .font(.blackSmall)
                    .foregroundStyle(Color.accentLighter)
            }
            Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.accentColor)
        }
    }
}
#Preview {
    let action = {}
    IconButton(buttonText: "Placeholder", iconName: "login.icon",action: action)
}
