//
//  TituloConIconoColapsable.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//

import SwiftUI

struct TituloConIconoColapsable: View {
    let iconName : String?
    let title : String
    let isCollapsed : Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack(alignment: .center){
            if let icon = iconName{
                Image(systemName: icon)
            }
            Text(title)
                .font(.regularLarge)
            Spacer()
            Image(isCollapsed ? "arrow.up.icon" : "arrow.down.icon")
                .onTapGesture{
                    onTap()
                }
        }

    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TituloConIconoColapsable(iconName: "house", title: "Placeholder", isCollapsed: false, onTap: {})
}

