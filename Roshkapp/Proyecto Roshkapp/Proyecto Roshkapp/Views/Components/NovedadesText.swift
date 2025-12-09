//
//  NovedadesText.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct NovedadesText: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                ProfilePic()
                VStack(alignment: .leading){
                    Text("Alguien Fulano")
                    Text("Hace 1 semana")
                        .font(.regularSmaller)
                }
                Spacer()
            }
            Text("Lorem ipsum et as Bienvenidos a mi primera pagina web etcetc este es un mockup de una novedad.")
                .font(.regularSmall)
                .padding(.vertical)
        }
        .padding(Spacing.m)
    }
}

#Preview {
    NovedadesText()
}
