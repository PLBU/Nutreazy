//
//  ShortStringTextField.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct ShortStringTextField: View {
    @Binding var value: String
    var label: String
    var placeholder: String = ""
    var maxLength: Int

    var body: some View {
        HStack {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            EditText(value: $value, placeholder: placeholder, width: 140, isCenter: true, maxLength: maxLength)
        }
    }
}

struct ShortStringTextField_Previews: PreviewProvider {
    static var previews: some View {
        ShortStringTextField(value: .constant(""), label: "Test", maxLength: 50)
    }
}
