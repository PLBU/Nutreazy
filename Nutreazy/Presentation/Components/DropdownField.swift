//
//  DropdownField.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 21/10/23.
//

import SwiftUI

struct DropdownField: View {
    @Binding var value: String
    var label: String
    var placeholder: String = "Pilih"
    var options: [String]

    var body: some View {
        HStack {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            Dropdown(value: $value, placeholder: placeholder, options: options, width: 140)
        }
    }
}

struct DropdownField_Previews: PreviewProvider {
    static var previews: some View {
        DropdownField(value: .constant(""), label: "I am a Label", options: ["Option 1", "Option 2", "Option 3"])
    }
}
