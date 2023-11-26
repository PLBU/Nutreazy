//
//  FoodDiaryView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI
import RealmSwift

struct FoodDiaryView: View {
    @ObservedResults(FoodLogModel.self) private var foodLogs
    
    @Binding var foodLogsByDate: [FoodLogModel]
    @State private var filteredFoodLogs = [MealType: [FoodLogModel]]()
    
    private func filterFoodLogs() {
        filteredFoodLogs = [MealType: [FoodLogModel]]()
        
        for foodLog in foodLogsByDate {
            if filteredFoodLogs.keys.contains(foodLog.mealType!) {
                filteredFoodLogs[foodLog.mealType!]!.append(foodLog)
            } else {
                filteredFoodLogs[foodLog.mealType!] = [foodLog]
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Group {
                Text("Diari ")
                    .font(HEADING_4)
                    .foregroundColor(PRIMARY_COLOR) +
                Text("Makananmu 🥑")
                    .font(HEADING_4)
                    .foregroundColor(TEXT_COLOR)
            }

            if filteredFoodLogs.isEmpty {
                VStack(alignment: .center, spacing: 20) {
                    Text("Kamu belum catat \napapun nih :( ")
                        .multilineTextAlignment(.center)
                        .font(HEADING_5)
                        .foregroundColor(ACCENT_COLOR)
                        .fixedSize(horizontal: false, vertical: true)

                    Group {
                        Text("Coba ")
                            .foregroundColor(TEXT_COLOR) +
                        Text("tambah ")
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("di +")
                            .foregroundColor(TEXT_COLOR)
                    }
                    .font(HEADING_5)
                }
                .padding(.vertical, 80)
                .frame(maxWidth: .infinity)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(PRIMARY_COLOR, lineWidth: 1)
                )
            } else {
                ForEach(0...(mealTypeListID.count - 1), id: \.self) { index in
                    if let mealType = MealType(rawValue: index), let foodLogs = filteredFoodLogs[mealType] {
                        FoodLogGroup(foodLogs: foodLogs)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .onChange(of: foodLogsByDate, perform: { _ in
            filterFoodLogs()
        })
        .onAppear {
//            $foodLogs.append(
//                FoodLogModel(
//                    foodInfo: FoodInfoModel(
//                        name: "Ayam Rebus",
//                        servingName: "g",
//                        servingSize: 1,
//                        calories: 1,
//                        carbohydrate: 1,
//                        protein: 4,
//                        fat: 1
//                    ),
//                    amount: 50,
//                    mealType: MealType.ExtraMeal
//                )
//            )
            filterFoodLogs()
        }
    }
}

struct FoodDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryView(foodLogsByDate: .constant([]))
    }
}
