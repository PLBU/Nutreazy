//
//  FoodLogGroup.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI

typealias FoodRowOnClick = (_ foodLog: FoodLogModel) -> Void

struct FoodLogGroup: View {
    var foodLogs: [FoodLogModel]
    var foodRowListener: FoodRowOnClick
    @State private var isExpanded = false
    
    private var totalCalories: Double {
        get {
            foodLogs.reduce(0, { prev, foodLog in
                prev + foodLog.calories
            })
        }
    }
    
    struct MealTypeText: View {
        var text: String
        @Binding var isExpanded: Bool
        
        var body: some View {
            Text(text)
            .font(HEADING_5)
            .foregroundColor(TEXT_COLOR)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if isExpanded {
                MealTypeText(
                    text: mealTypeListID[ (foodLogs.first?.mealType)?.rawValue ?? 0],
                    isExpanded: $isExpanded
                )
                
                VStack(spacing: 8) {
                    ForEach(foodLogs, id: \.id) { foodLog in
                        FoodLogRow(foodLog: foodLog)
                            .onTapGesture {
                                foodRowListener(foodLog)
                            }
                    }
                }
            } else {
                HStack {
                    MealTypeText(
                        text: mealTypeListID[ (foodLogs.first?.mealType)?.rawValue ?? 0],
                        isExpanded: $isExpanded
                    )
                    
                    Spacer()
                    
                    Chip(text: String(Int(totalCalories)) + "cal")
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(PRIMARY_COLOR, lineWidth: 1)
        )
    }
}

struct FoodLogGroup_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogGroup(foodLogs: [
            FoodLogModel(
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
            ),
            FoodLogModel(
                foodInfo: FoodInfoModel(
                    name: "Boiled Chicken Breast with Gravy Sauce",
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
        ], foodRowListener: { foodLog in
            print(foodLog)
        })
    }
}
