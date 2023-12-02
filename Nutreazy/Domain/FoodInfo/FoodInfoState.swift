//
//  FoodInfoState.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import Foundation

struct FoodInfoState: Equatable {
    var name: String = ""
    var servingName: String = ""
    var servingSize: String = ""
    var calories: String = ""
    var carbohydrate: String = ""
    var protein: String = ""
    var fat: String = ""
    
    func toModel() -> FoodInfoModel {
        return FoodInfoModel(
            name: self.name,
            servingName: self.servingName,
            servingSize: Double(self.servingSize) ?? 0,
            calories: Double(self.calories) ?? 0,
            carbohydrate: Double(self.carbohydrate) ?? 0,
            protein: Double(self.protein) ?? 0,
            fat: Double(self.fat) ?? 0
        )
    }
    
    func isValid() -> Bool {
        return !name.isEmpty && !servingName.isEmpty && !servingSize.isEmpty && !calories.isEmpty && !carbohydrate.isEmpty && !protein.isEmpty && !fat.isEmpty
    }
}
