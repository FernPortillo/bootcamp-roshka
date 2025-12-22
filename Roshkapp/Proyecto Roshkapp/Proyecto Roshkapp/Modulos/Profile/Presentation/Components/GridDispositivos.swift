//
//  GridDispositivos.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-16.
//

import SwiftUI

struct GridDispositivos: View {
    let dispositivos : [DispositivoModel]
    var body: some View {
        LazyVGrid(columns:
                    [GridItem(.flexible(minimum: 50, maximum: 220)),
                     GridItem(.flexible(minimum: 50, maximum: 220))],
                  alignment: .center,
                  spacing: 10)
        {
            GridRow{
                ForEach(dispositivos, id: \.idDispositivo) {dispositivo in
                    SquaredComponentWithIconNoValue(iconName: DispositivoModel.getDeviceIcon(tipo: dispositivo.tipoDispositivo),
                                                    textTitle: dispositivo.modelo)
                }
            }
        }
    }
}

