//
//  AddFoodLogView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct AddFoodLogView: View {
    var foodInfo: FoodInfoModel
    @Binding var isShowDialog: Bool
    @State private var foodLogState: FoodLogState = FoodLogState()
    @State private var isShowAlert = false
    @State private var isButtonEnabled = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(foodInfo.name)
                .font(HEADING_5)
                .foregroundColor(TEXT_COLOR)
            
            DoubleEditText(value: $foodLogState.amount, unitName: foodInfo.servingName, isCenter: true, maxLength: 7)
            
            Dropdown(value: $foodLogState.mealType, options: mealTypeListID)
            
            VStack(spacing: 12) {
                HStack {
                    Text("Kalori")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(Int(foodInfo.calories))cal")
                }
                
                HStack {
                    Text("Karbohidrat")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(Int(foodInfo.carbohydrate))g")
                }
                
                HStack {
                    Text("Protein")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(Int(foodInfo.protein))g")
                }
                
                HStack {
                    Text("Lemak")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(Int(foodInfo.fat))g")
                }
            }
            
            CustomButton(label: "Tambah", isEnabled: $isButtonEnabled) {
                withAnimation {
                    isShowDialog = false
                }
                UIApplication.shared.endEditing()
            }
        }
        .onChange(of: foodLogState) {
            isButtonEnabled = $0.isValid()
        }
        .alert("Terjadi kesalahan", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) {
                isShowAlert = false
            }
        }
    }
}

struct AddFoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodLogView(
            foodInfo: FoodInfoModel(
                name: "Dada Ayam",
                servingName: "g",
                servingSize: 1,
                calories: 2,
                carbohydrate: 2,
                protein: 1,
                fat: 1
            ),
            isShowDialog: .constant(false)
        )
    }
}
