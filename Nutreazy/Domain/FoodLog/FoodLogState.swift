//
//  FoodLogState.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import Foundation

struct FoodLogState: Equatable {
    var amount: String = ""
    var mealType: String = ""
    
    func isValid() -> Bool {
        return !amount.isEmpty && !mealType.isEmpty
    }

    func toModel(foodInfo: FoodInfoModel, date: Date) -> FoodLogModel {
        return FoodLogModel(
            foodInfo: foodInfo,
            createdAt: date,
            amount: Double(self.amount) ?? 0,
            mealType: self.mealType == mealTypeListID[0]
                ? MealType.Breakfast
                : self.mealType == mealTypeListID[1]
                    ? MealType.Brunch
                    : self.mealType == mealTypeListID[2]
                        ? MealType.Lunch
                        : self.mealType == mealTypeListID[3]
                            ? MealType.Dinner
                            : self.mealType == mealTypeListID[4]
                                ? MealType.Snack
                                : MealType.ExtraMeal

        )
    }
}
