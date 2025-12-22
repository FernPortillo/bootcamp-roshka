//
//  MisSolicitudesScreen.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-15.
//

import SwiftUI

struct MisSolicitudesScreen: View {
    @Environment(\.appColors) var colors
    @State private var isShowingFilterSheet = false
    @State private var estadoFilter: EstadosSolicitud? = nil
    @State private var subtipoBeneficioFiltrado: SubtiposBeneficios? = nil
    @State private var subtipoPermisoFiltrado: SubtiposPermisos? = nil
    @State private var filtrosAplicados = false
    
    var solicitudes : [SolicitudesResponseModel]
    let tipoSolicitud : String
    
    private var solicitudesFiltradas: [SolicitudesResponseModel] {
            return solicitudes.filter { solicitud in
                if let estado = estadoFilter {
                    let cumpleEstado = solicitud.estado.prefix(1).uppercased() == estado.rawValue.prefix(1).uppercased()
                    if !cumpleEstado { return false }
                }
                switch tipoSolicitud {
                case "Beneficios":
                    if let subtipo = subtipoBeneficioFiltrado {
                        if solicitud.nombreSubTipoSolicitud != subtipo.rawValue {
                            return false
                        }
                    }
                case "Permisos":
                    if let subtipo = subtipoPermisoFiltrado {
                        if solicitud.nombreSubTipoSolicitud != subtipo.rawValue {
                            return false
                        }
                    }
                default:
                    break
                }
                return true
            }
        }
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            ScrollView{
                VStack{
                    Text("Gestion de \(tipoSolicitud)")
                            .font(.boldLarge)
                    
                    Divider()
                        .padding(.vertical, Spacing.m)
                    
                    VStack{
                        ListaSolicitudes(solicitudes: solicitudesFiltradas)
                    }
                }
            }
            Button {
                isShowingFilterSheet.toggle()
            } label: {
                Image("filter.icon")
                    .font(.title.weight(.semibold))
                    .padding()
                    .background(colors.accentColor)
                    .foregroundColor(colors.textColor)
                    .clipShape(Circle())
                    .shadow(radius: 4, x: 0, y: 4)
            }
            .padding()
        }
        .background(colors.appBackgroundColor)
        .sheet(isPresented: $isShowingFilterSheet) {
            FilterSheet(
                estadoSelectedIndex: $estadoFilter,
                beneficioSubtipoSelectedIndex: $subtipoBeneficioFiltrado,
                permisoSubtipoSelectedIndex: $subtipoPermisoFiltrado,
                isShowingFull: $isShowingFilterSheet,
                isBeneficios: tipoSolicitud == "Beneficios",
                isPermisos: tipoSolicitud == "Permisos",
                onApplyFilters: {
                    print("Filtros aplicados: Estado=\(String(describing: estadoFilter)), Beneficio=\(String(describing: subtipoBeneficioFiltrado)), Permiso=\(String(describing: subtipoPermisoFiltrado))")
                },
                onClearFilters: {
                    estadoFilter = nil
                    subtipoBeneficioFiltrado = nil
                    subtipoPermisoFiltrado = nil
                    print("Filtros limpiados")
                })
            .presentationDetents([.medium, .large])
            .padding()
            
        }
    }
}

#Preview {
    @Previewable let router = Router()
    let solicitudes = SolicitudesResponseModel.solicitudesMock
    let photosVM = ProfilePicViewModel(profilePicUsecase: ProfilePicUseCase.mock())
    let appStateMock = AppState.mockAuthenticated()
    MisSolicitudesScreen(solicitudes: solicitudes, tipoSolicitud: "Beneficios")
        .environmentObject(photosVM)
        .environmentObject(appStateMock)
        .environment(router)
        .withAppColors()
}
