//
//  NovedadesComponent.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-09.
//

import SwiftUI

struct NovedadesManager: View {
    let novedades: [NovedadesModel]
    var body: some View {
        VStack(alignment: .leading){
            Text("Avisos")
                .font(.boldMedium)
                .padding(.horizontal, Spacing.mm)
            ForEach(novedades, id: \.idNovedades) { novedad in
                NovedadesText(novedad: novedad)
            }
        }
    }
}


#Preview {
    var novedades = NovedadesModel.mockNovedadText
    var sortedMock = novedades.sorted { $0.prioridad && !$1.prioridad}
    NovedadesManager(novedades: sortedMock)
}

