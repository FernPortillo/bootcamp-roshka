//
//  Checkbox.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked : Bool
    var textoCheckBox : String = "Placeholder"
    var body: some View {
        Toggle(textoCheckBox, isOn: $isChecked)
            .font(.boldSmaller)
            .toggleStyle(CheckboxToggleStyle())
    }
}


struct CheckboxToggleStyle: ToggleStyle {
    @Environment(\.appColors) var colors
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      ZStack{
          Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            .resizable()
            .foregroundStyle(colors.mainColor)
            .frame(width: 16, height: 16)
            .onTapGesture { configuration.isOn.toggle() }

      }
        configuration.label
    }
  }
}


#Preview(traits: .sizeThatFitsLayout) {
    CustomCheckbox(isChecked: .constant(false), textoCheckBox: "Recuerdame")
        .withAppColors()
}
