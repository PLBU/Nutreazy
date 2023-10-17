//
//  Dropdown.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI

struct Dropdown: View {
    @Binding private var value: String
    private let placeholder = "Pilih"
    private var unitName = ""
    private var width = Double.infinity
    
    init(value: Binding<String>, label: String = "", width: Double = Double.infinity) {
        self._value = value
        self.width = width
    }
    
    
    var body: some View {
        HStack {
            if value.isEmpty {
                Text(placeholder)
                    .font(PARAGRAPH_1)
                    .foregroundColor(ACCENT_COLOR)
            } else {
                Text(value)
                    .font(PARAGRAPH_1)
                    .foregroundColor(TEXT_COLOR)
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
        .onTapGesture {
            print("I am tapped")
        }
    }
    
    public func getValue() -> String {
        return value
    }
}

struct Dropdown_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Dropdown(value: .constant(""))
        }
    }
}
