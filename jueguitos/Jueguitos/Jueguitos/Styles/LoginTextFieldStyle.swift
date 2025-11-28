//
//  LoginTextFieldStyle.swift
//  Jueguitos
//
//  Created by Bootcamp on 2025-11-27.
//

import SwiftUI

let azulField = Color(red: 0.729, green: 0.788, blue: 0.784)

struct LoginTextFieldStyle : TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical)
            .padding(.horizontal)
            .background(
                Color(azulField))
            .clipShape(Capsule(style: .continuous))
    }
}

struct PassTextFieldStyle : TextFieldStyle{
    @Binding var isPassVisible: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        HStack{
            configuration
            Button {isPassVisible.toggle()}
            label: {
                Image(systemName: isPassVisible ? "eye.slash.fill" : "eye.fill")
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(
            Color(azulField))
        .clipShape(Capsule(style: .continuous))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TextField("", text: .constant("hola"))
        .textFieldStyle(LoginTextFieldStyle())
}
