//
//  NovedadesComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct NovedadesComponent: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Novedades")
                .font(.boldMedium)
                .padding()
            NovedadesText()
            NovedadesText()
            NovedadesText()
        }
    }
}

#Preview {
    NovedadesComponent()
}
