//
//  TextField.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI


struct CustomPassField: View {
    @Binding var inputText : String
    @State var isPasswordVisible : Bool = false
    var fieldText : String = "Placeholder"
    var body: some View {
        
        if isPasswordVisible {
            TextField("",
                      text: $inputText,
                        prompt:
                        Text(fieldText)
                .font(.boldBody)
                .foregroundStyle(Color.darkerBackgroundColor))
            
            
            .safeAreaInset(edge: .leading) {
                Image(systemName: "lock")
                    .foregroundStyle(Color.mainColor)
                    .padding(.trailing, 8)
            }
            
            .safeAreaInset(edge: .trailing) {
                Image(systemName: "eye.slash")
                    .onTapGesture{isPasswordVisible.toggle()}
                    .foregroundStyle(Color.mainColor)
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
        else
        {
            SecureField("",
                      text: $inputText,
                        prompt:
                        Text(fieldText)
                .font(.boldBody)
                .foregroundStyle(Color.darkerBackgroundColor))
                        
            .safeAreaInset(edge: .leading) {
                Image(systemName: "lock")
                    .foregroundStyle(Color.mainColor)
                    .padding(.trailing, 8)
            }
            
            .safeAreaInset(edge: .trailing) {
                Image(systemName: "eye")
                    .onTapGesture{isPasswordVisible.toggle()}
                    .foregroundStyle(Color.mainColor)
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
}

#Preview {
    @Previewable @State var texto = ""
    CustomPassField( inputText: $texto, fieldText: "Contrasena")
}

