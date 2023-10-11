//
//  FoodLog.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation

enum MealType {
    case Breakfast
    case Brunch
    case Lunch
    case Snack
    case ExtraMeal
}

class FoodLog {
    var id: UUID
    var foodInfo: FoodInfo
    var amount: Int
    var mealType: MealType
    var calories: Int       // in cal
    var carbohydrate: Int   // in grams
    var protein: Int        // in grams
    var fat: Int            // in grams

    init(id: UUID, foodInfo: FoodInfo, amount: Int, mealType: MealType, calories: Int, carbohydrate: Int, protein: Int, fat: Int) {
        self.id = id
        self.foodInfo = foodInfo
        self.amount = amount
        self.mealType = mealType
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.fat = fat
    }
}
