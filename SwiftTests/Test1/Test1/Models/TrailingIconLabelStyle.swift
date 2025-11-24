//
//  TrailingIconLabelStyle.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI

// Esto lo que hace es que el icono este despues del texto
struct TrailingIconLabelStyle : LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack
        {
            configuration.title
            configuration.icon
        }
    }
}

// Define la var trailingIcon para poder usarla
extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon: Self {Self()}
}
