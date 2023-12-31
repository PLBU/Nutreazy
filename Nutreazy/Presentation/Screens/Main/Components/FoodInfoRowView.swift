//
//  FoodInfoRow.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct FoodInfoRow: View {
    var foodInfo: FoodInfoModel
    
    var body: some View {
        HStack {
            Text(foodInfo.getSummaryString())
                .font(PARAGRAPH_1)
                .foregroundColor(TEXT_COLOR)
            Spacer()
            Chip(text: "\(Int(foodInfo.calories))cal")
        }
        .padding(.vertical, 8)
        .overlay(Divider().background(ACCENT_COLOR), alignment: .bottom)
    }
}

struct FoodInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FoodInfoRow(
                foodInfo: FoodInfoModel(
                    name: "Dada Ayam",
                    servingName: "g",
                    servingSize: 1,
                    calories: 2,
                    carbohydrate: 2,
                    protein: 1,
                    fat: 1
                )
            )
            FoodInfoRow(
                foodInfo: FoodInfoModel(
                    name: "Dada Ayam",
                    servingName: "g",
                    servingSize: 1,
                    calories: 2,
                    carbohydrate: 2,
                    protein: 1,
                    fat: 1
                )
            )
            FoodInfoRow(
                foodInfo: FoodInfoModel(
                    name: "Dada Ayam",
                    servingName: "g",
                    servingSize: 1,
                    calories: 2,
                    carbohydrate: 2,
                    protein: 1,
                    fat: 1
                )
            )
        }
    }
}
