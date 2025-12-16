//
//  BottomTabbarView.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-13.
//

import SwiftUI

struct BottomTabbarView: View {
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            UnevenRoundedRectangle(topLeadingRadius: 0,
                                   bottomLeadingRadius: 42,
                                   bottomTrailingRadius: 42,
                                   topTrailingRadius: 0,
                                   style: .continuous)
            .fill(.background)
            HStack{
                TabbarButton(tabName: "Home", iconName: "house", action: { selectedTab = 0 })
                
                UnevenRoundedRectangle(topLeadingRadius: 0,
                                       bottomLeadingRadius: 100,
                                       bottomTrailingRadius: 100,
                                       topTrailingRadius: 0,
                                       style: .continuous)
                .fill(Color.appBackgroundColor)
                .frame(width: 120, height: 80)
                .padding([.leading, .trailing, .bottom])
                .padding(.bottom)
                .overlay(alignment: .top){
                    SemiCircleTabBar(onActionSelected: {})
                }
                
                TabbarButton(tabName: "Ver Mas", iconName: "ellipsis"){
                    selectedTab = 1
                }
            }
        }
        .frame(height: 80)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BottomTabbarView(selectedTab: .constant(0))
}
