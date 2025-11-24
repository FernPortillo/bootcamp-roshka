//
//  ThemePicker.swift
//  Test1
//
//  Created by Bootcamp on 2025-11-24.
//

import SwiftUI
import ThemeKit

struct ThemePicker: View {
    @Binding var selection : Theme
    var body: some View {
        Picker("Theme", selection: $selection)
        {
            ForEach(Theme.allCases){theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    @Previewable @State var theme = Theme.poppy
    ThemePicker(selection: $theme)
}
