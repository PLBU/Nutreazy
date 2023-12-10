//
//  AddFoodLogView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct AddFoodLogView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dayLogManager: DayLogManager
    @Binding var isShowDialog: Bool
    @Binding var foodLogState: FoodLogState
    @State private var isShowAlert = false
    @State private var isButtonEnabled = false
    var date: Date

    private func handleAddFoodLog() {
        do {
            try dayLogManager.addCurrentDayFoodLog(
                date: date,
                foodLog: foodLogState.toModel(date: date)
            )

            withAnimation {
                isShowDialog = false
            }
            UIApplication.shared.endEditing()
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            isShowAlert = true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(foodLogState.foodInfo.name)
                .font(HEADING_5)
                .foregroundColor(TEXT_COLOR)
            
            DoubleEditText(value: $foodLogState.amount, unitName: foodLogState.foodInfo.servingName, isCenter: true, maxLength: 7)
            
            Dropdown(value: $foodLogState.mealType, options: mealTypeListID)
            
            VStack(spacing: 12) {
                HStack {
                    Text("Kalori")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(foodLogState.calories)cal")
                }
                
                HStack {
                    Text("Karbohidrat")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(foodLogState.carbohydrate)g")
                }
                
                HStack {
                    Text("Protein")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(foodLogState.protein)g")
                }
                
                HStack {
                    Text("Lemak")
                        .font(PARAGRAPH_1)
                    Spacer()
                    Chip(text: "\(foodLogState.fat)g")
                }
                
            }
            
            Text("[*Sumber Data](https://www.kaggle.com/datasets/niharika41298/nutrition-details-for-most-common-foods/)")
                .font(PARAGRAPH_2)
                .foregroundColor(ACCENT_COLOR)
            
            CustomButton(label: "Tambah", isEnabled: $isButtonEnabled) {
                handleAddFoodLog()
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
            isShowDialog: .constant(false),
            foodLogState: .constant(FoodLogState(
                foodInfo: FoodInfoModel(
                    name: "Dada Ayam",
                    servingName: "g",
                    servingSize: 1,
                    calories: 2,
                    carbohydrate: 2,
                    protein: 1,
                    fat: 1
                )
            )),
            date: Date().withoutTime()
        )
    }
}
