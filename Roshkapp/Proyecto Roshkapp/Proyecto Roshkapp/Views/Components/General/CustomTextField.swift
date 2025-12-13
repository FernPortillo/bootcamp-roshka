//
//  LoginMailField.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var inputText : String
    var fieldText : String = "Placeholder"
    let icon : String
    var body: some View {
        TextField("",
                  text: $inputText,
                    prompt:
                    Text(fieldText)
            .font(.boldBody)
            .foregroundStyle(Color.darkerBackgroundColor))
        
        
        .safeAreaInset(edge: .leading) {
            Image(systemName: icon)
                .foregroundStyle(Color.mainColor)
                .padding(.trailing, 8)
        }
        
        .padding()
        .frame(minHeight: 56)
        .background{
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.darkBackgroundColor)
        }
        
        .textInputAutocapitalization(.never)
        .autocorrectionDisabled()
        .keyboardType(.asciiCapable)
    }
}

#Preview {
    @Previewable @State var t = ""
    CustomTextField(inputText: $t, fieldText: "Ingresa tu correo", icon: "envelope")
}

