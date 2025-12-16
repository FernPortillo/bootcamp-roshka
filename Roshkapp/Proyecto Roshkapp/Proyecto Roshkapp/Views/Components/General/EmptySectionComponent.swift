//
//  EmptySectionComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

import SwiftUI

struct EmptySectionComponent : View{
    let mensaje : String
    let icon : String
    var systemName : Bool = false
    var body : some View{
        Group{
            Text(mensaje)
                .font(.blackMedium)
                .padding()
            Image(named: icon, system: systemName)
                .resizable()
                .frame(width: 100, height: 100)
            }
        .foregroundStyle(Color.darkerBackgroundColor)
    }
}



