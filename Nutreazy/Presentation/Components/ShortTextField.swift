//
//  ShortTextField.swift
//  Nutreazy
//  EditText with labeled
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI

struct ShortTextField: View {
    @Binding private var value: String
    private var label: String
    private var unitName: String
    
    init(value: Binding<String>, label: String, unitName: String) {
        self._value = value
        self.label = label
        self.unitName = unitName
    }

    var body: some View {
        HStack {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            EditText(value: $value, unitName: unitName, width: 160, isCenter: true)
        }
    }
}

struct ShortTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ShortTextField(value: .constant(""), label: "I am a Label", unitName: "unitName")
            ShortTextField(value: .constant(""), label: "Umur", unitName: "tahun")
        }
    }
}
