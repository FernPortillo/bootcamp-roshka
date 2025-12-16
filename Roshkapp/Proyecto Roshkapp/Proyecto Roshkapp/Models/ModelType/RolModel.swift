//
//  RolModel.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-04.
//

import SwiftUI

struct RolModel: Codable
{
    let idRol: Int
    let nombre: String
    
    static func getRoleIcon(_ nombre : String) -> String
    {
        switch nombre{
        case "TALENTO HUMANO":
            return "person.2.fill"
        case "OPERACIONES":
            return "gearshape.fill"
        case "ADMINISTRADOR DEL SISTEMA":
            return "lock.shield.fill"
        case "DESARROLLO":
            return "chevron.left.forwardslash.chevron.right"
        case "DIRECTORES":
            return "building.2.fill"
        case "TEAM LIDER":
            return "person.crop.circle.badge.checkmark"
        default:
            return "person.fill"
        }
        
    }

}


/*
 1    "TALENTO HUMANO"
 2    "OPERACIONES"
 3    "ADMINISTRADOR DEL SISTEMA"
 4    "DESARROLLO"
 5    "DIRECTORES"
 6    "TEAM LIDER"
 */
