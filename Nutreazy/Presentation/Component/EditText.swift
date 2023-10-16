//
//  EditText.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 16/10/23.
//

import SwiftUI

struct EditText: View {
    @State private var value = ""
    private var placeholder = ""
    private var label = ""
    private var unitName = ""
    private var width = Double.infinity
    private var isCenter = false
    
    init(value: String = "", placeholder: String = "", label: String = "", unitName: String = "", width: Double = Double.infinity, isCenter: Bool = false) {
        self.value = value
        self.placeholder = placeholder
        self.label = label
        self.unitName = unitName
        self.width = width
        self.isCenter = isCenter
    }
    
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $value)
                .fixedSize(horizontal: isCenter, vertical: false)
                .font(PARAGRAPH_1)
            !unitName.isEmpty
                ? Text(unitName)
                    .font(PARAGRAPH_1)
                    .foregroundColor(ACCENT_COLOR)
                : nil
        }
        .frame(maxWidth: width)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(PRIMARY_COLOR, lineWidth: 1)
        )
    }
    
    public func getValue() -> String {
        return value
    }
}

struct EditText_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EditText(placeholder: "I am an EditText")
            EditText(placeholder: "0", unitName: "kg", width: 160)
            EditText(placeholder: "0", unitName: "kg", width: 120, isCenter: true)
        }
    }
}
