//
//  SideMenuRowType.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-17.
//



enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case gestiones
    case verBeneficios
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .gestiones:
            return "Gestiones"
        case .verBeneficios:
            return "Ver mis Beneficios"
        
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .gestiones:
            return "folder"
        case .verBeneficios:
            return "gift"
            
        }
    }
    
    var rolesPermitidos: [Int] {
        switch self {
        case .home, .verBeneficios, .gestiones:
            return [] // Vacío = todos pueden ver
        }
    }
    
    func tienePermisoTH(_ permisosTH: Bool) -> Bool {
        if rolesPermitidos.isEmpty {
            return true
        }
        
        if rolesPermitidos.contains(1) {
            return permisosTH
        }
        
        return false
        
    }

    
    var destination: PushDestination? {
        switch self {
        case .home: return nil
        case .gestiones: return nil
        case .verBeneficios: return .beneficiosLista
            
        }
    }
    
}

import Foundation
struct SubMenuItem{
    let id = UUID()
    let name: String
    let icon: String
    let destination: PushDestination?
}

extension SideMenuRowType
{
    var tieneSubmenu : Bool {
        switch self{
        case .gestiones: return true
        default: return false
        }
    }
    func submenuItems(vm: SolicitudesViewmodel) -> [SubMenuItem] {
        switch self {
        case .gestiones:
            return [SubMenuItem(name: "Ver Vacaciones", icon: "beach.umbrella", destination: .solicitudesListScreen(solicitudes: vm.vacaciones, tipoSolicitud: "Vacaciones")),
                    SubMenuItem(name: "Ver Beneficios", icon: "gift", destination: .solicitudesListScreen(solicitudes: vm.beneficios, tipoSolicitud: "Beneficios")),
                    SubMenuItem(name: "Ver Permisos", icon: "checkmark.seal", destination: .solicitudesListScreen(solicitudes: vm.permisos, tipoSolicitud: "Permisos"))]
        default:
            return []
        }
    }

}
