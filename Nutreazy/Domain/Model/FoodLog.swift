//
//  FoodLog.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation
import RealmSwift

enum MealType: Int, PersistableEnum {
    case Breakfast
    case Brunch
    case Lunch
    case Snack
    case ExtraMeal
}

class FoodLog: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var foodInfo: FoodInfo?
    @Persisted var amount: Int
    @Persisted var mealType: MealType?
    @Persisted var calories: Int       // in cal
    @Persisted var carbohydrate: Int   // in grams
    @Persisted var protein: Int        // in grams
    @Persisted var fat: Int            // in grams

    convenience init(foodInfo: FoodInfo?, amount: Int, mealType: MealType?, calories: Int, carbohydrate: Int, protein: Int, fat: Int) {
        self.init()
        self.foodInfo = foodInfo
        self.amount = amount
        self.mealType = mealType
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.fat = fat
    }
}
