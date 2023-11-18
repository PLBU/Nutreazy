//
//  CustomButton.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 13/10/23.
//

import SwiftUI

struct CustomButton: View {
    @Binding var isEnabled: Bool
    var label: String
    var action: () -> Void
    
    init(label: String, isEnabled: Binding<Bool> = .constant(true), action: @escaping () -> Void) {
        self.action = action
        self.label = label
        self._isEnabled = isEnabled
    }
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(PARAGRAPH_1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .disabled(!isEnabled)
        .padding(12)
        .background(isEnabled ? PRIMARY_COLOR : DISABLED_COLOR)
        .cornerRadius(16)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label:"I am a Button", isEnabled: .constant(false), action: {
            print("Button clicked")
        })
    }
}
