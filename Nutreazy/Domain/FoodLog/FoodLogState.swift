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
}
