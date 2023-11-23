//
//  FloatingButton.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 23/11/23.
//

import SwiftUI

struct FloatingButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.title.weight(.medium))
                .padding(24)
                .background(PRIMARY_COLOR)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 2, x: -1, y: 2)

        }
        .padding(20)
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(action: { print("I am clicked")})
    }
}
