//
//  EmptySectionComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

import SwiftUI

struct EmptySectionComponent : View{
    @Environment(\.appColors) var colors
    let mensaje : String
    let icon : String
    var systemName : Bool = false
    var body : some View{
        VStack(alignment: .center){
            Text(mensaje)
                .font(.boldLarge)
                .padding()
            Image(named: icon, system: systemName)
                .resizable()
                .frame(width: 100, height: 100)
            }
        .foregroundStyle(colors.mainColor)
    }
}

#Preview {
    EmptySectionComponent(mensaje: "Esta parte no tiene algo", icon: IconsEnum.sadface.rawValue)
        .withAppColors()

}

