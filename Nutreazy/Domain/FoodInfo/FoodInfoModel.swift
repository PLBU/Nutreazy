//
//  FoodInfoModel.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation
import RealmSwift

class FoodInfoModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var servingName: String // g, grams, spoon(s), cup(s)
    @Persisted var servingSize: Double
    @Persisted var calories: Double       // in cal
    @Persisted var carbohydrate: Double   // in grams
    @Persisted var protein: Double        // in grams
    @Persisted var fat: Double            // in grams
    
    convenience init(name: String, servingName: String, servingSize: Double, calories: Double, carbohydrate: Double, protein: Double, fat: Double) {
        self.init()
        self.name = name
        self.servingName = servingName
        self.servingSize = servingSize
        self.calories = calories
        self.carbohydrate = carbohydrate
        self.protein = protein
        self.fat = fat
    }
    
    func getSummaryString() -> String {
        let servingSizeString = (floor(servingSize) == servingSize)
            ? String(Int(servingSize))
            : String(format: "%.2f", servingSize)
        
        return "\(self.name) (\(servingSizeString)\(self.servingName))"
    }
}
