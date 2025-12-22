//
//  GenerarBotonesHamburguesa.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-18.
//

import SwiftUI

struct GenerarBotonesHamburguesa: View {
    @Environment(\.appColors) var colors
    @Environment(Router.self) var router
    @EnvironmentObject var solicitudesVM : SolicitudesViewmodel
    @EnvironmentObject var appState : AppState
    @State private var expandedMenus: Set<String> = []
    @Binding var viewIndex : String
    @Binding var isShowing: Bool
    var permisosTH: Bool = false

    var body: some View {
        let menuPermitido = SideMenuRowType.allCases.filter { menu in
            menu.tienePermisoTH(permisosTH)
        }
        
        ForEach(menuPermitido, id:\.self){ i in
            VStack(alignment: .leading, spacing: 0) {
                Button(action: {
                    if i.tieneSubmenu {
                        // Toggle submenu
                        if expandedMenus.contains(i.title) {
                            expandedMenus.remove(i.title)
                        } else {
                            expandedMenus.insert(i.title)
                        }
                    } else {
                        // Navigate
                        if let destination = i.destination{
                            router.navigate(to: destination)
                        }
                        viewIndex = i.title
                        withAnimation(.spring()){
                            isShowing.toggle()
                        }
                    }
                    
                }){
                    HStack{
                        Image(systemName: i.iconName)
                            .resizable()
                            .foregroundStyle(viewIndex == i.title ? colors.accentColor : Color.white)
                            .frame(width: 32, height: 32)
                            .padding(.trailing, Spacing.mm)
                        
                        Text(i.title)
                            .font(.boldMedium)
                            .lineLimit(1)
                            .foregroundStyle(viewIndex == i.title ? colors.accentColor : Color.white)
                        
                        Spacer()
                        
                        if i.tieneSubmenu {
                            Image(systemName: expandedMenus.contains(i.title) ? "chevron.up" : "chevron.down")
                                .foregroundStyle(Color.white)
                                .frame(width: 24, height: 24)
                                .padding(.trailing, Spacing.m)
                        }
                    }
                    .padding(.bottom, Spacing.m)
                }
                
                // Submenú
                if i.tieneSubmenu && expandedMenus.contains(i.title) {
                    VStack(alignment: .leading, spacing: Spacing.xs) {
                        ForEach(i.submenuItems(vm: solicitudesVM), id: \.id) { subItem in
                            Button(action: {
                                if let destination = subItem.destination
                                {
                                    router.navigate(to: destination)
                                }
                                viewIndex = subItem.name
                                withAnimation(.spring()){
                                    isShowing.toggle()
                                }
                            }) {
                                HStack {
                                    Image(systemName: subItem.icon)
                                        .foregroundStyle(viewIndex == subItem.name ? colors.accentColor : Color.white)

                                    Text(subItem.name)
                                        .font(.regularBody)
                                        .foregroundStyle(viewIndex == subItem.name ? colors.accentColor : Color.white)
                                        .foregroundStyle(viewIndex == subItem.name ? colors.accentColor : Color.white)

                                }
                                .padding(.bottom, Spacing.m)
                                .padding(.leading, Spacing.m)
                            }
                        }
                    }
                    .padding(.leading, Spacing.mm)
                }
            }
        }
        .task{
            if solicitudesVM.solicitudes.isEmpty{
                if solicitudesVM.solicitudes.isEmpty {
                    let isTH = appState.myUser.rol.idRol == 1
                    await solicitudesVM.loadSolicitudes(isTH: isTH)
                }
            }
        }
    }
}

