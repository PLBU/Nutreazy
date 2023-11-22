//
//  Chip.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 22/11/23.
//

import SwiftUI

struct Chip: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(PARAGRAPH_1)
            .foregroundColor(Color.white)
            .padding(8)
            .background(PRIMARY_COLOR)
            .cornerRadius(16)
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        Chip(text: "Sample")
    }
}
