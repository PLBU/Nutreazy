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
                .padding(10)
                .background(BACKGROUND_COLOR)
                .cornerRadius(24)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
                .padding(10)
        }
        .background(.thinMaterial)
        .opacity(isActive ? 1 : 0)
    }
}

struct CustomDialog_Previews: PreviewProvider {
    static var previews: some View {
        CustomDialog(isActive: .constant(true)) {
            AddFoodInfoView(isShowDialog: .constant(true))
        }
    }
}
