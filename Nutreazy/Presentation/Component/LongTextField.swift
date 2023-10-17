//
//  LongTextField.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 17/10/23.
//

import SwiftUI


struct LongTextField: View {
    @Binding private var value: String
    private var label: String
    private var placeholder: String
    
    init(value: Binding<String>, label: String, placeholder: String) {
        self._value = value
        self.label = label
        self.placeholder = placeholder
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            EditText(value: $value, placeholder: placeholder)
        }
    }
}

struct LongTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LongTextField(value: .constant(""), label: "I am a Label", placeholder: "I am a placeholder")
            LongTextField(value: .constant(""), label: "Nama", placeholder: "Nama kamu")
        }
    }
}
