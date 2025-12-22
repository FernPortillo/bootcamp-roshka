//
//  TextField.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI


struct CustomPassField: View {
    @Environment(\.appColors) var colors
    @Binding var inputText : String
    @State var isPasswordVisible : Bool = false
    var fieldText : String = "Placeholder"
    var body: some View {
        
        if isPasswordVisible {
            TextField("",
                      text: $inputText,
                        prompt:
                        Text(fieldText)
                .foregroundStyle(colors.darkerBackgroundColor))
            .font(.regularBody)
            
            .safeAreaInset(edge: .leading) {
                Image(systemName: "lock")
                    .foregroundStyle(colors.mainColor)
                    .padding(.trailing, 8)
            }
            
            .safeAreaInset(edge: .trailing) {
                Image(systemName: "eye.slash")
                    .onTapGesture{isPasswordVisible.toggle()}
                    .foregroundStyle(colors.mainColor)
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
        else
        {
            SecureField("",
                      text: $inputText,
                        prompt:
                        Text(fieldText)
                .foregroundStyle(colors.darkerBackgroundColor))
            .font(.regularBody)

            .safeAreaInset(edge: .leading) {
                Image(systemName: "lock")
                    .foregroundStyle(colors.mainColor)
                    .padding(.trailing, 8)
            }
            
            .safeAreaInset(edge: .trailing) {
                Image(systemName: "eye")
                    .onTapGesture{isPasswordVisible.toggle()}
                    .foregroundStyle(colors.mainColor)
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
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable @State var texto = ""
    CustomPassField( inputText: $texto, fieldText: "Contrasena")
        .withAppColors()
}

