//
//  IntTextField.swift
//  Nutreazy
//  EditText with labeled
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI

struct IntTextField: View {
    @Binding var value: String
    var label: String
    var unitName: String
    var maxLength = 3

    var body: some View {
        HStack {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            IntEditText(value: $value, unitName: unitName, width: 140, isCenter: true, maxLength: maxLength)
        }
    }
}

struct IntTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IntTextField(value: .constant(""), label: "I am a Label", unitName: "unitName")
            IntTextField(value: .constant(""), label: "Umur", unitName: "tahun")
        }
    }
}
