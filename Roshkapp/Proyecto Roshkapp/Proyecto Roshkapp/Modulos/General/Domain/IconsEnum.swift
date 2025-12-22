//
//  IconsEnum.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-12.
//
import SwiftUI

enum IconsEnum : String {
    case sadface = "sadface.icon"
    case cancel = "xmark.circle"
    
}

// Para poder usar con systemName
extension Image {
    init(named name: String, system: Bool = false) {
        if system {
            self = Image(systemName: name)
        } else {
            self = Image(name)
        }
    }
}
