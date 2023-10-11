//
//  FoodInfo.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation

class FoodInfo {
    var id: UUID
    var name: String
    var servingName: String // g, grams, spoon(s), cup(s)
    var servingSize: Int
    var calories: Int       // in cal
    var carbohydrate: Int   // in grams
    var protein: Int        // in grams
    var fat: Int            // in grams
    
    init(id: UUID, name: String, servingName: String, servingSize: Int, calories: Int, carbohydrate: Int, protein: Int, fat: Int) {
        self.id = id
        self.name = name
        self.servingName = servingName
        self.servingSize = servingSize
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.fat = fat
    }
}
