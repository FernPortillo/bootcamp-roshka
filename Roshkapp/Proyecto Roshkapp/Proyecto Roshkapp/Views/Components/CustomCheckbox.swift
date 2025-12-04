//
//  Checkbox.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-03.
//

import SwiftUI

struct CustomCheckbox: View {
    @State var isChecked : Bool = false
    var textoCheckBox : String = "Placeholder"
    var body: some View {
        Toggle(textoCheckBox, isOn: $isChecked)
            .font(.boldSmaller)
            .toggleStyle(CheckboxToggleStyle())
    }
}


struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    HStack {
      ZStack{
          Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            .resizable()
            .foregroundStyle(Color.mainColor)
            .frame(width: 16, height: 16)
            .onTapGesture { configuration.isOn.toggle() }

      }
        configuration.label
    }
  }
}


#Preview {
    CustomCheckbox(textoCheckBox: "Recuerdame")
}
