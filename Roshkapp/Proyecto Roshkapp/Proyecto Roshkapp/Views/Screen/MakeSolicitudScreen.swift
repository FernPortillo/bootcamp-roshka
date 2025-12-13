//
//  MakeSolicitudScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//

import SwiftUI

struct MakeSolicitudScreen: View {
    @State private var startDate = Date()
    @State private var daysCount : Int = 3
    @State private var coment = ""
    @State private var selectedPermiso: Permisos = .permisoPorMatrimonio
    @State private var isStepperLocked = true
        
    var body: some View {
        VStack{
            Text("Solicitar un permiso")
            HStack{
                Text("Seleccione el tipo de Permiso:")
                Spacer()
                Picker("Flavor", selection: $selectedPermiso) {
                    ForEach(Permisos.allCases) { permiso in
                        Text(permiso.rawValue.capitalized)
                            .tag(permiso)
                    }
                }
                .onChange(of: selectedPermiso)
                {
                    daysCount = selectedPermiso.dias
                    if daysCount != 0 {
                        isStepperLocked = true
                    }
                    else {
                        isStepperLocked = false
                    }
                }
            }
            HStack{
                Text("Cantidad de días: \(daysCount)")

                Stepper("", value: $daysCount)
                    .disabled(isStepperLocked)
                    .opacity(isStepperLocked ? 0.5 : 1)
                    .foregroundStyle(isStepperLocked ? Color.gray : Color.black)
            }
            DatePicker(
                   "Fecha de Inicio:",
                   selection: $startDate,
                   displayedComponents: [.date])
            CustomTextField(inputText: $coment,
                            fieldText: "Describa su permiso...",
                            icon: "bubble")
            IconButton(buttonText: "Realizar Solicitud",
                       iconName: "paperplane.fill",
                       systemName: true,
                       action: {print("solicitud realizada")})
        }
        .padding()
    }
}

#Preview {
    MakeSolicitudScreen()
}
enum Permisos: String, CaseIterable, Identifiable {
    case permisoPorMatrimonio = "Matrimonio"
    case permisoPorFallecimientoConyugeHijos = "Fallecimiento Conyuge/Hijos"
    case permisoPorFallecimientoPadresHermanos = "Fallecimiento Padres/Hermanos"
    case permisoPorNacimientoDeHijo = "Nacimiento"
    case permisoMedico = "Medico"
    case permisoPorEstudios = "Estudios"
    case permisoPorTramitesPersonales = "Tramites Personales"
    case permisoPorDonacionDeSangre = "Donacion de Sangre"
    case permisoPorServicioMilitar = "Servicio Militar"
    case permisoPorCitacionJudicial = "Citacion Judicial"
    case permisoPorEmergenciaFamiliar = "Emergencia Familiar"
    case licenciaPorMaternidad = "Maternidad"
    case licenciaPorPaternidad = "Paternidad"
    case permisoSindical = "Sindical"
    case permisoPorCumpleanos = "Cumpleaños"

    var id: Self { self }
    
    var dias: Int {
        switch self {
        case .permisoPorMatrimonio:
            return 3
        case .permisoPorFallecimientoConyugeHijos:
            return 3
        case .permisoPorFallecimientoPadresHermanos:
            return 1
        case .permisoPorNacimientoDeHijo:
            return 1
        case .permisoMedico, .permisoPorEstudios, .permisoPorTramitesPersonales, .permisoPorServicioMilitar,
                .permisoPorCitacionJudicial, .permisoPorEmergenciaFamiliar, .permisoSindical:
            return 0
        case .permisoPorDonacionDeSangre:
            return 1
        case .licenciaPorMaternidad:
            return 150
        case .licenciaPorPaternidad:
            return 14
        case .permisoPorCumpleanos:
            return 1
        }
    }
}
