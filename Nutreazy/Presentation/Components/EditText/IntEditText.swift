//
//  IntEditText.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 18/11/23.
//

import SwiftUI
import Combine

struct IntEditText: View {
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
                .keyboardType(.numberPad)
                .onReceive(Just(value)) { newValue in
                    let filtered = newValue.filter { Set("0123456789").contains($0) }
                    if filtered.count > maxLength {
                        self.value = String(value.prefix(maxLength))
                        return
                    }
                    if filtered != newValue {
                        self.value = filtered
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

struct IntEditText_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            IntEditText(value: .constant(""), placeholder: "I am an EditText", maxLength: 3)
        }
    }
}
