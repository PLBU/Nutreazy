//
//  FoodLogModel.swift
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
    case Dinner
    case Snack
    case ExtraMeal
}

class FoodLogModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var foodInfo: FoodInfoModel?
    @Persisted var createdAt: Date
    @Persisted var amount: Double
    @Persisted var mealType: MealType?
    @Persisted var calories: Double       // in cal
    @Persisted var carbohydrate: Double   // in grams
    @Persisted var protein: Double        // in grams
    @Persisted var fat: Double            // in grams

    convenience init(foodInfo: FoodInfoModel, createdAt: Date = Date(), amount: Double, mealType: MealType) {
        self.init()
        self.foodInfo = foodInfo
        self.createdAt = createdAt
        self.amount = amount
        self.mealType = mealType
        self.calories = foodInfo.calories * amount
        self.carbohydrate = foodInfo.carbohydrate * amount
        self.protein = foodInfo.protein * amount
        self.fat = foodInfo.fat * amount
    }
}
