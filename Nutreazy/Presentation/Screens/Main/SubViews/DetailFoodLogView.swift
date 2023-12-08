//
//  DetailFoodLogView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct DetailFoodLogView: View {
    @EnvironmentObject var dayLogManager: DayLogManager
    @Binding var isShowDialog: Bool
    @Binding var foodLogModel: FoodLogModel
    @Binding var foodLogState: FoodLogState
    @State private var isShowAlert = false
    @State private var isButtonEnabled = false
    var date: Date

    private func handleUpdateFoodLog() {
        do {
            try dayLogManager.updateCurrentDayFoodLog(
                date: date,
                foodLog: foodLogModel,
                newFoodLog: foodLogState.toModel(date: date)
            )

            withAnimation {
                isShowDialog = false
            }
            UIApplication.shared.endEditing()
        } catch {
            isShowAlert = true
        }
    }
    
    private func handleDeleteFoodLog() {
        do {
            try dayLogManager.deleteCurrentDayFoodLog(date: date, foodLog: foodLogModel)
            withAnimation {
                isShowDialog = false
            }
            UIApplication.shared.endEditing()
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
            
            Button() {
                handleDeleteFoodLog()
            } label : {
                Text("Hapus")
                    .font(PARAGRAPH_2)
                    .foregroundColor(ACCENT_COLOR)
            }
            .frame(maxWidth: .infinity)
            
            CustomButton(label: "Simpan", isEnabled: $isButtonEnabled) {
                handleUpdateFoodLog()
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

struct DetailFoodLogView_Previews: PreviewProvider {
    static var previews: some View {
        DetailFoodLogView(
            isShowDialog: .constant(false),
            foodLogModel: .constant(FoodLogModel()),
            foodLogState: .constant(
                FoodLogState(foodInfo: FoodInfoModel())
            ),
            date: Date().withoutTime()
        )
    }
}
