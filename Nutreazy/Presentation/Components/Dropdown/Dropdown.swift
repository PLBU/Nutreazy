//
//  Dropdown.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI

struct Dropdown: View {
    @Binding var value: String
    @FocusState private var isFocused: Bool
    var placeholder: String = "Pilih"
    var options: [String]
    var width = Double.infinity
    
    let colors = ["Red", "Green", "Blue"]
    
    
    var body: some View {
        HStack {
            Menu {
                Picker(placeholder, selection: $value) { ForEach(options, id: \.self) {
                    option in Text(option)
                }}
            } label: {
                Text(value.isEmpty ? placeholder : value)
                    .font(PARAGRAPH_1)
                    .foregroundColor(value.isEmpty ? ACCENT_COLOR : TEXT_COLOR)
            }
            Image(systemName: "chevron.down")
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
