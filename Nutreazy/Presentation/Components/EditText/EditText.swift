//
//  EditText.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 16/10/23.
//

import SwiftUI
import Combine

struct EditText: View {
    @Binding var value: String
    @FocusState private var isFocused: Bool
    var placeholder = ""
    var unitName = ""
    var width = Double.infinity
    var isCenter = false
    var maxLength: Int
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $value)
                .keyboardType(.default)
                .onSubmit {
                    UIApplication.shared.endEditing()
                }
                .onReceive(Just(value)) { newValue in
                    if newValue.count > maxLength {
                        self.value = String(value.prefix(maxLength))
                    }
                }
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
        .frame(width: width)
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
            EditText(value: .constant(""), placeholder: "I am an EditText", maxLength: 12)
            EditText(value: .constant(""), placeholder: "0", unitName: "kg", width: 160, maxLength: 15)
            EditText(value: .constant(""), placeholder: "0", unitName: "kg", width: 120, isCenter: true, maxLength: 10)
        }
    }
}
