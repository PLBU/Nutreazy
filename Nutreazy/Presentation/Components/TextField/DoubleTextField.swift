//
//  DoubleTextField.swift
//  Nutreazy
//  EditText with labeled
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI

struct DoubleTextField: View {
    @Binding var value: String
    var label: String
    var unitName: String
    var maxLength = 6

    var body: some View {
        HStack {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            DoubleEditText(value: $value, unitName: unitName, width: 140, isCenter: true, maxLength: maxLength)
        }
    }
}

struct DoubleTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DoubleTextField(value: .constant(""), label: "I am a Label", unitName: "unitName")
            DoubleTextField(value: .constant(""), label: "Umur", unitName: "tahun")
        }
    }
}
