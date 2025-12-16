//
//  TabbarButton.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-13.
//

import SwiftUI

struct TabbarButton: View {
    let tabName: String
    let iconName: String
    var isSelected: Bool = true
    let action: () -> Void
    var body: some View {
        Button(action: action){
                VStack{
                    ZStack{
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 40, height: 32)
                                .foregroundStyle(Color.altBGColor)
                                .opacity(isSelected ? 0.8 : 0)
                        Image(systemName: iconName)
                    }
                    Text(tabName)
                        .font(.regularSmall)
                }
                .padding()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TabbarButton(tabName: "Home", iconName: "house", action: {})
}
