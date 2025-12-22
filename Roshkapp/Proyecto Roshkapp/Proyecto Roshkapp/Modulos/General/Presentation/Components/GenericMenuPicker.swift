//
//  GenericMenuPicker.swift
//  Proyecto Roshkapp
//
//  Created by Bootcamp on 2025-12-21.
//
import SwiftUI

struct GenericMenuPicker<Item: Hashable & RawRepresentable>: View where Item.RawValue == String{
    @Environment(\.appColors) var colors
    @Binding var selection: Item
    let items: [Item]

     var body: some View {
         Menu {
             ForEach(items, id: \.self) { item in
                 Button(item.rawValue) {
                     selection = item
                 }
             }
         } label: {
             HStack {
                 Text(selection.rawValue)
                     .font(.regularBody)
                     .foregroundStyle(colors.mainColor)
                 Image(systemName: "chevron.up.chevron.down")
                     .foregroundStyle(colors.mainColor)
             }
             .padding(.horizontal, 8)
             .padding(.vertical, 4)
         }
     }
}
