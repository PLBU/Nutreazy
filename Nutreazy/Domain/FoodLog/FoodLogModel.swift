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
    @Persisted var date: Date
    @Persisted var amount: Int
    @Persisted var mealType: MealType?
    @Persisted var calories: Int       // in cal
    @Persisted var carbohydrate: Int   // in grams
    @Persisted var protein: Int        // in grams
    @Persisted var fat: Int            // in grams

    convenience init(foodInfo: FoodInfoModel, date: Date = Date().withoutTime(), amount: Int, mealType: MealType?) {
        self.init()
        self.foodInfo = foodInfo
        self.date = date
        self.amount = amount
        self.mealType = mealType
        self.calories = foodInfo.calories * amount
        self.carbohydrate = foodInfo.carbohydrate * amount
        self.protein = foodInfo.protein * protein
        self.fat = foodInfo.fat * fat
    }
}
