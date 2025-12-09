//
//  Colors.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

extension Color {
    
    /// Colores principales y acento
    static let mainColor : Color = Color(hex: "1C76BA")
    static let appBackgroundColor : Color = Color(hex: "EBF9F7")
    static let accentColor : Color = Color(hex: "EEB311")
    
    /// Colores para destacar y textos
    static let darkBackgroundColor : Color = Color(hex: "E5EFF0")
    static let darkerBackgroundColor : Color = Color(hex: "A9C0C1")
    static let yetDarkerBackgroundColor : Color = Color(hex: "7A999A")
    
    /// (( SE PUEDE USAR ACCENT LIGHTER PARA STATE!!! ))
    static let accentLighter : Color = Color(hex: "F6F0DE")

    /// Colores para alertas y states
    static let pendingTextColor : Color = Color(hex: "9C982D")
    static let deniedBackgroundColor : Color = Color(hex: "F0A7A7")
    static let deniedTextColor : Color = Color(hex: "CC5656")
    static let approvedBackgroundColor : Color = Color(hex: "CBE9D1")
    static let approvedTextColor : Color = Color(hex: "37923D")
    
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
