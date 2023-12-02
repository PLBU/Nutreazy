//
//  AddFoodInfoView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct AddFoodInfoView: View {
    @Binding var isShowDialog: Bool
    @State private var foodInfoState: FoodInfoState = FoodInfoState()
    @State private var isButtonEnabled = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Tambah Makanan\nCustom Kamu 🍡")
                .font(HEADING_5)
                .foregroundColor(TEXT_COLOR)
            
            VStack {
                LongStringTextField(value: $foodInfoState.name, label: "Nama Makanan", placeholder: "Misalnya makanan fav-mu", maxLength: 50)
                
                ShortStringTextField(value: $foodInfoState.servingName, label: "Serving Name", placeholder: "g", maxLength: 15)
                
                DoubleTextField(value: $foodInfoState.servingSize, label: "Serving Size", unitName: foodInfoState.servingName)
                
                DoubleTextField(value: $foodInfoState.calories, label: "Kalori", unitName: "cal")
                
                DoubleTextField(value: $foodInfoState.calories, label: "Karbohidrat", unitName: "g")
                
                DoubleTextField(value: $foodInfoState.protein, label: "Protein", unitName: "g")
                
                DoubleTextField(value: $foodInfoState.fat, label: "Lemak", unitName: "g")
            }
            
            CustomButton(label: "Tambah", isEnabled: $isButtonEnabled) {
                withAnimation {
                    isShowDialog = false
                }
            }
        }
    }
}

struct AddFoodInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodInfoView(isShowDialog: .constant(true))
    }
}
