//
//  CustomButton.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 13/10/23.
//

import SwiftUI

struct CustomButton: View {
    private var label: String
    private var action: () -> Void
    
    init(label: String, action: @escaping () -> Void) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .font(PARARAGPH_1)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .padding(12)
        .background(PRIMARY_COLOR)
        .cornerRadius(16)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(label:"I am a Button", action: {
            print("Button clicked")
        })
    }
}
