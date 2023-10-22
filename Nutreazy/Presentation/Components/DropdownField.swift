//
//  DropdownField.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 21/10/23.
//

import SwiftUI

struct DropdownField: View {
    @Binding var value: String
    @State private var isInfoShown: Bool = false
    var label: String
    var placeholder: String = "Pilih"
    var options: [String]
    var info: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                    .font(PARAGRAPH_1)
                    .foregroundColor(TEXT_COLOR)
                    .onTapGesture {
                        if !info.isEmpty {isInfoShown.toggle()}
                    }
                Spacer()
                Dropdown(value: $value, placeholder: placeholder, options: options, width: 140)
            }
            
            if isInfoShown && !info.isEmpty {
                Text(info)
                    .font(PARAGRAPH_2)
                    .foregroundColor(ACCENT_COLOR)
            }
        }
    }
}

struct DropdownField_Previews: PreviewProvider {
    static var previews: some View {
        DropdownField(value: .constant(""), label: "I am a Label", options: ["Option 1", "Option 2", "Option 3"])
    }
}
