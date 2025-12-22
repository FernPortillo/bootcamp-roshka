//
//  FullSolicitud.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct FilterSheet: View {
    @Environment(\.appColors) var colors
    @Binding var estadoSelectedIndex: EstadosSolicitud?
    @Binding var beneficioSubtipoSelectedIndex: SubtiposBeneficios?
    @Binding var permisoSubtipoSelectedIndex: SubtiposPermisos?
    
    @State private var estadoTemp: EstadosSolicitud?
    @State private var beneficioTemp: SubtiposBeneficios?
    @State private var permisoTemp: SubtiposPermisos?
    
    @State var isEstadoCollapsed = true
    @State var isPermisosCollapsed = true
    @State var isBeneficiosCollapsed = true
    
    @Binding var isShowingFull : Bool
    var isBeneficios: Bool = false
    var isPermisos: Bool = false
    
    var onApplyFilters: (() async -> Void)?
    var onClearFilters: (() async -> Void)?
    
    private func limpiarFiltros() async{
        print("Limpiar Filtros ejecutado")
        estadoTemp = nil
        beneficioTemp = nil
        permisoTemp = nil
                
        estadoSelectedIndex = nil
        beneficioSubtipoSelectedIndex = nil
        permisoSubtipoSelectedIndex = nil
                
        await onClearFilters?()
        isShowingFull.toggle()
    }
    private func aplicarFiltros() async{
        estadoSelectedIndex = estadoTemp
        beneficioSubtipoSelectedIndex = beneficioTemp
        permisoSubtipoSelectedIndex = permisoTemp
        isShowingFull.toggle()
    }
    
    var body: some View {
        VStack{
            Group{
                TituloConIconoColapsable(iconName: nil, title: "Estado",
                                         isCollapsed: !isEstadoCollapsed)
                {
                    isEstadoCollapsed.toggle()
                }
                Divider()
                if !isEstadoCollapsed{
                    HStack{
                        ForEach(EstadosSolicitud.allCases){ estado in
                            CustomSelectButton(selected: $estadoTemp, labelBoton: estado.rawValue, value: estado)
                        }
                    }
                    .padding(.vertical, Spacing.m)
                }
            }
            .padding(.horizontal, Spacing.m)

            
            if isPermisos{
                Group{
                    TituloConIconoColapsable(iconName: nil, title: "Permisos",
                                             isCollapsed: !isPermisosCollapsed)
                    {
                        isPermisosCollapsed.toggle()
                    }
                    Divider()
                    if !isPermisosCollapsed{
                        ScrollView{
                            VStack(alignment: .leading){
                                ForEach(SubtiposPermisos.allCases){ permiso in
                                    CustomSelectButton(selected: $permisoTemp, labelBoton: permiso.rawValue, value: permiso)
                                }
                            }
                        }
                        .padding(.vertical, Spacing.m)
                    }
                }
                .padding(.horizontal, Spacing.m)
            }

            
            Group{
                if isBeneficios{
                    TituloConIconoColapsable(iconName: nil, title: "Beneficios",
                                             isCollapsed: !isBeneficiosCollapsed)
                    {
                        isBeneficiosCollapsed.toggle()
                    }
                    Divider()
                    if !isBeneficiosCollapsed{
                        let columns = [
                            GridItem(.fixed(160)),
                            GridItem(.fixed(160)),
                        ]
                        ScrollView{
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(SubtiposBeneficios.allCases) { beneficio in
                                    CustomSelectButton(
                                        selected: $beneficioTemp,
                                        labelBoton: beneficio.rawValue,
                                        value: beneficio
                                    )
                                }
                            }
                        }
                        .padding(.vertical, Spacing.m)
                    }
                }
            }
            .padding(.horizontal, Spacing.m)

            HStack{
                IconButton(buttonText: "Borrar Filtros",
                           iconName:"xmark",
                           systemName:true,
                           action: { await limpiarFiltros() },
                           colorTexto: Color.white,
                           colorFondo: colors.deniedTextColor)
                IconButton(buttonText: "Filtrar",
                           iconName:"checkmark",
                           systemName:true,
                           action: { await aplicarFiltros() })
            }
            .padding(Spacing.xs)
        }
        .onAppear {
            estadoTemp = estadoSelectedIndex
            beneficioTemp = beneficioSubtipoSelectedIndex
            permisoTemp = permisoSubtipoSelectedIndex
        }
        .padding()
    }
}


#Preview {
    FilterSheet(
        estadoSelectedIndex: .constant(nil),
        beneficioSubtipoSelectedIndex: .constant(nil),
        permisoSubtipoSelectedIndex: .constant(nil),
        isShowingFull: .constant(false))
        .withAppColors()
}

struct CustomSelectButton<T: Equatable>: View {
    @Environment(\.appColors) var colors
    @Binding var selected: T
    let labelBoton: String
    let value: T

    var body: some View {
        Button(action: {
            selected = value
        }) {
            Text(labelBoton)
                .font(.regularBody)
                .foregroundStyle(selected == value ? colors.altTextColor : colors.mainColor)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(selected == value ? colors.accentColor : .clear)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(colors.mainColor, lineWidth: 1)
                )
        }
    }
}
