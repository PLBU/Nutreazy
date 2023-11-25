//
//  FoodLogRow.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI

struct FoodLogRow: View {
    var foodLog: FoodLogModel
    
    var body: some View {
        HStack{
            Group {
                Text(foodLog.foodInfo?.name ?? "") +
                Text(" (" + String(foodLog.amount)) +
                Text(String(foodLog.foodInfo?.servingName ?? "") + ")")
            }
            .font(PARAGRAPH_1)
            .foregroundColor(TEXT_COLOR)
            Spacer()
            Chip(text: String(foodLog.calories) + "cal")
        }
    }
}

struct FoodLogRow_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogRow(
            foodLog: FoodLogModel(
                foodInfo: FoodInfoModel(
                    name: "Boiled Chicken Breast",
                    servingName: "g",
                    servingSize: 1,
                    calories: 22,
                    carbohydrate: 1,
                    protein: 2,
                    fat: 1
                ),
                amount: 125,
                mealType: MealType.Breakfast
            )
        )
    }
}
