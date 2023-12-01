//
//  CustomDialog.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 01/12/23.
//

import SwiftUI

struct CustomDialog<Content: View>: View {
    @Binding var isActive: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    withAnimation {
                        isActive = false
                    }
                }
            
            content
                .padding(20)
                .background(BACKGROUND_COLOR)
                .cornerRadius(24)
                .padding(20)
        }
        .background(.thinMaterial)
        .opacity(isActive ? 1 : 0)
    }
}

struct CustomDialog_Previews: PreviewProvider {
    static var previews: some View {
        CustomDialog(isActive: .constant(true)) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Tambah Berat Badan")
                    .font(HEADING_5)
                    .foregroundColor(TEXT_COLOR)
                
                DoubleEditText(value: .constant("0"), unitName: "kg", width: 100, isCenter: true, maxLength: 3)
                    .frame(maxWidth: .infinity)
                
                CustomButton(label: "Tambah") {
                    print("Something")
                }
            }
        }
    }
}
