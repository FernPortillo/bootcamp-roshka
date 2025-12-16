//
//  BottomTabbarView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-13.
//

import SwiftUI

struct BottomTabbarView: View {
    @Binding var selectedTab: Int
    @Binding var isButtonOpen: Bool
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 0,
                                   bottomLeadingRadius: 42,
                                   bottomTrailingRadius: 42,
                                   topTrailingRadius: 0,
                                   style: .continuous)
            .fill(.background)
            HStack(spacing: 0){
                TabbarButton(tabName: "Home",
                             iconName: "house",
                             isSelected: selectedTab == 0,
                             action: { selectedTab = 0 })
                    .frame(maxWidth: .infinity)
                
                Spacer(minLength: 80)
                
                TabbarButton(tabName: "Ver Mas",
                             iconName: "ellipsis",
                             isSelected: selectedTab == 1){
                    selectedTab = 1
                }
                .frame(maxWidth: .infinity)

            }
        }
        .overlay{
            UnevenRoundedRectangle(topLeadingRadius: 0,
                                   bottomLeadingRadius: 100,
                                   bottomTrailingRadius: 100,
                                   topTrailingRadius: 0,
                                   style: .continuous)
            .fill(Color.appBackgroundColor.opacity(0))
            .frame(width: 120, height: 80)
            .padding([.leading, .trailing, .bottom])
            .padding(.bottom, Spacing.mm)
            .overlay(alignment: .top){
                SemiCircleTabBar(isExpanded: $isButtonOpen){ action in
                    switch action {
                        case .beneficios:
                        print("beneficios")
                        case .dispositivos:
                            print("dispositivps")
                        case .permisos:
                            print("permisos")
                        case .vacaciones:
                            print("vacaciones")
                    }
                    selectedTab = 3
                }
                
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 2)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BottomTabbarView(selectedTab: .constant(0), isButtonOpen: .constant(false))
        .padding(40)
}
