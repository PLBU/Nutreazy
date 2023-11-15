//
//  FoodInfo.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation
import RealmSwift

class FoodInfo: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var servingName: String // g, grams, spoon(s), cup(s)
    @Persisted var servingSize: Int
    @Persisted var calories: Int       // in cal
    @Persisted var carbohydrate: Int   // in grams
    @Persisted var protein: Int        // in grams
    @Persisted var fat: Int            // in grams
    
    convenience init(name: String, servingName: String, servingSize: Int, calories: Int, carbohydrate: Int, protein: Int, fat: Int) {
        self.init()
        self.name = name
        self.servingName = servingName
        self.servingSize = servingSize
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.fat = fat
    }
}
