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
    var foodInfo: FoodInfoModel
    var calories: String {
        get {
            if (foodInfo.servingSize == 0) {return "0"}
            let count = (Double(self.amount) ?? 0)/foodInfo.servingSize * foodInfo.calories
            let countString = (floor(count) == count)
                ? String(Int(count))
                : String(format: "%.2f", count)
            return countString
        }
    }
    var carbohydrate: String {
        get {
            if (foodInfo.servingSize == 0) {return "0"}
            let count = (Double(self.amount) ?? 0)/foodInfo.servingSize * foodInfo.carbohydrate
            let countString = (floor(count) == count)
                ? String(Int(count))
                : String(format: "%.2f", count)
            return countString
        }
    }
    var protein: String {
        get {
            if (foodInfo.servingSize == 0) {return "0"}
            let count = (Double(self.amount) ?? 0)/foodInfo.servingSize * foodInfo.protein
            let countString = (floor(count) == count)
                ? String(Int(count))
                : String(format: "%.2f", count)
            return countString
        }
    }
    var fat: String {
        get {
            if (foodInfo.servingSize == 0) {return "0"}
            let count = (Double(self.amount) ?? 0)/foodInfo.servingSize * foodInfo.fat
            let countString = (floor(count) == count)
                ? String(Int(count))
                : String(format: "%.2f", count)
            return countString
        }
    }
    
    init(foodInfo: FoodInfoModel) {
        self.foodInfo = foodInfo
        self.amount = String(foodInfo.servingSize)
        self.mealType = ""
    }
    
    func isValid() -> Bool {
        return !amount.isEmpty && !mealType.isEmpty
    }

    func toModel(date: Date) -> FoodLogModel {
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
