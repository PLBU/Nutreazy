//
//  LongStringTextField.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI


struct LongStringTextField: View {
    @Binding var value: String
    var label: String
    var placeholder: String
    var maxLength: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            EditText(value: $value, placeholder: placeholder, maxLength: maxLength)
        }
    }
}

struct LongStringTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LongStringTextField(value: .constant(""), label: "I am a Label", placeholder: "I am a placeholder", maxLength: 10)
            LongStringTextField(value: .constant(""), label: "Nama", placeholder: "Nama kamu", maxLength: 10)
        }
    }
}
