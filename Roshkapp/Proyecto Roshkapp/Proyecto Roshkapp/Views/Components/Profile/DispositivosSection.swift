//
//  DispositivosSection.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-11.
//

import SwiftUI

struct DispositivosSection: View {
    
    let dispositivos : [DispositivoModel]
    var body: some View {
        VStack(alignment: .leading){
            Text("Dispositivos")
                .font(.regularLarge)
            VStack{
                if dispositivos.isEmpty{
                    EmptySectionComponent(
                        mensaje: "Este usuario no posee dispositivos",
                        icon: IconsEnum.cancel.rawValue,
                        systemName: true)
                }
                else {
                    ForEach(dispositivos, id: \.idDispositivo) {dispositivo in
                        ProfileComponentInfoCustomIcon(icon: DispositivoModel.getDeviceIcon(tipo: dispositivo.tipoDispositivo),
                            value: dispositivo.modelo)
                    }
                }
            }
        }
    }
}

#Preview {
    DispositivosSection(dispositivos: UserModel.mockUser.equipos!)
}
