//
//  EditText.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 16/10/23.
//

import SwiftUI

struct EditText: View {
    @Binding private var value: String
    @FocusState private var isFocused: Bool
    private var placeholder = ""
    private var label = ""
    private var unitName = ""
    private var width = Double.infinity
    private var isCenter = false
    
    init(value: Binding<String>, placeholder: String = "", label: String = "", unitName: String = "", width: Double = Double.infinity, isCenter: Bool = false) {
        self._value = value
        self.placeholder = placeholder
        self.label = label
        self.unitName = unitName
        self.width = width
        self.isCenter = isCenter
        self.isFocused = false
    }
    
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $value)
                .foregroundColor(TEXT_COLOR)
                .fixedSize(horizontal: isCenter, vertical: false)
                .font(PARAGRAPH_1)
                .focused($isFocused)
            if !unitName.isEmpty {
                Text(unitName)
                    .font(PARAGRAPH_1)
                    .foregroundColor(ACCENT_COLOR)
            }
        }
        .frame(maxWidth: width)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(PRIMARY_COLOR, lineWidth: 1)
        )
        .onTapGesture {
            isFocused.toggle()
        }
    }
}

struct EditText_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            EditText(value: .constant(""), placeholder: "I am an EditText")
            EditText(value: .constant(""), placeholder: "0", unitName: "kg", width: 160)
            EditText(value: .constant(""), placeholder: "0", unitName: "kg", width: 120, isCenter: true)
        }
    }
}
