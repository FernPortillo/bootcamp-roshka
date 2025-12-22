//
//  Colors.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

protocol AppColorsProtocol {
    var mainColor: Color { get }
    var colorBackgroundLogin : Color { get }
    var appBackgroundColor: Color { get }
    var accentColor: Color { get }
    var altBGColor: Color { get }
    var clearMainColor: Color { get }
    var textColor: Color { get }
    var altTextColor: Color { get }
    var colorHamburger: Color { get }
    
    var darkBackgroundColor: Color { get }
    var darkerBackgroundColor: Color { get }
    var yetDarkerBackgroundColor: Color { get }
    
    var accentLighter: Color { get }
    
    var pendingTextColor: Color { get }
    var deniedBackgroundColor: Color { get }
    var deniedTextColor: Color { get }
    var approvedBackgroundColor: Color { get }
    var approvedTextColor: Color { get }
    var logoutColor: Color { get }
}



/// Gracias StackOverflow por los favores recibidos
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
