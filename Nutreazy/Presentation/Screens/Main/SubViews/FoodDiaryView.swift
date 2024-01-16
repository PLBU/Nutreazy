//
//  FoodDiaryView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI
import RealmSwift

struct FoodDiaryView: View {
    @EnvironmentObject var dayLogManager: DayLogManager
    @State private var filteredFoodLogs = [MealType: [FoodLogModel]]()
    
    var foodRowListener: FoodRowOnClick
    
    private func filterFoodLogs(_ dayLog: DayLogModel) {
        filteredFoodLogs = [MealType: [FoodLogModel]]()
        
        for foodLog in dayLog.foodLogs {
            if filteredFoodLogs.keys.contains(foodLog.mealType!) {
                filteredFoodLogs[foodLog.mealType!]!.append(foodLog)
            } else {
                filteredFoodLogs[foodLog.mealType!] = [foodLog]
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text("Diari ")
                    .font(HEADING_4)
                    .foregroundColor(PRIMARY_COLOR) +
                Text("Makananmu 🥑")
                    .font(HEADING_4)
                    .foregroundColor(TEXT_COLOR)
            }
            
            if filteredFoodLogs.isEmpty {
                VStack(alignment: .center, spacing: 10) {
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
                        FoodLogGroup(
                            foodLogs: foodLogs,
                            foodRowListener: foodRowListener
                        )
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .onChange(of: dayLogManager.dayLog, perform: { newDayLogModel in
            filterFoodLogs(newDayLogModel)
        })
        .onChange(of: dayLogManager.foodLogs, perform: { _ in
            filterFoodLogs(dayLogManager.dayLog)
        })
        .onAppear {
            filterFoodLogs(dayLogManager.dayLog)
        }
    }
}

struct FoodDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryView(foodRowListener: { foodLog in print(foodLog) })
            .environmentObject(DayLogManager())
    }
}
