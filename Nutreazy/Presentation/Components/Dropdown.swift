//
//  Dropdown.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI

struct Dropdown: View {
    @Binding private var value: String
    @FocusState private var isFocused: Bool
    private var placeholder: String? = "Pilih"
    private var options: [String] = []
    private var unitName = ""
    private var width = Double.infinity
    
    init(value: Binding<String>, label: String = "", width: Double = Double.infinity, options: [String] = [], placeholder: String? = "Pilih") {
        self._value = value
        self.width = width
        self.options = options
        self.placeholder = placeholder
    }
    
    let colors = ["Red", "Green", "Blue"]
    
    
    var body: some View {
        HStack {
            Menu {
                ForEach(options, id: \.self) {
                    option in Text(option)
                        .font(PARAGRAPH_1)
                        .foregroundColor(TEXT_COLOR)
                }
            } label: {
                Text(value.isEmpty ? placeholder! : value)
                    .font(PARAGRAPH_1)
                    .foregroundColor(value.isEmpty ? ACCENT_COLOR : TEXT_COLOR)
            }
            Image(uiImage:
                UIImage(named: "ic_dropdown")!.withConfiguration(
                    UIImage.SymbolConfiguration(weight: .thin)
                )
            )
            .renderingMode(.template)
            .foregroundColor(ACCENT_COLOR)
        }
        .frame(maxWidth: width)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(PRIMARY_COLOR, lineWidth: 1)
        )
    }
}

struct Dropdown_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Dropdown(value: .constant(""), options: ["Option 1", "Option 2", "Option 3"])
        }
    }
}
