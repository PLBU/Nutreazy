//
//  DropdownField.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 21/10/23.
//

import SwiftUI

struct DropdownField: View {
    @Binding private var value: String
    private var label: String
    private var placeholder: String? = "Pilih"
    private var options: [String]
    
    init(value: Binding<String>, label: String, placeholder: String? = "Pilih", options: [String]) {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.options = options
    }

    var body: some View {
        HStack {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            Dropdown(value: $value, width: 160, options: options, placeholder: placeholder)
        }
    }
}

struct DropdownField_Previews: PreviewProvider {
    static var previews: some View {
        DropdownField(value: .constant(""), label: "I am a Label", options: ["Option 1", "Option 2", "Option 3"])
    }
}
