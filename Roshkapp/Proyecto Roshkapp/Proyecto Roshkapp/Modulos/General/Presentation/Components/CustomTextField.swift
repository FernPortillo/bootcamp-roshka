//
//  LoginMailField.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct CustomTextField: View {
    @Environment(\.appColors) var colors
    @Binding var inputText : String
    var fieldText : String = "Placeholder"
    let icon : String
    var body: some View {
        TextField("",
                  text: $inputText,
                    prompt:
                    Text(fieldText)
            .foregroundStyle(colors.darkerBackgroundColor))
        .font(.regularBody)

        
        
        .safeAreaInset(edge: .leading) {
            Image(systemName: icon)
                .foregroundStyle(colors.mainColor)
                .padding(.trailing, 8)
        }
        
        .padding()
        .frame(minHeight: 56)
        .background{
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(colors.darkBackgroundColor)
        }
        
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .keyboardType(.asciiCapable)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var t = ""
    CustomTextField(inputText: $t, fieldText: "Ingresa tu correo", icon: "envelope")
        .withAppColors()
}

