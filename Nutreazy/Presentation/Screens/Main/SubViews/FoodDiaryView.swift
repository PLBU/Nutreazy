//
//  FoodDiaryView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI
import RealmSwift

struct FoodDiaryView: View {
    @Binding var dayLogByDate: DayLogModel
    @State private var filteredFoodLogs = [MealType: [FoodLogModel]]()
    
    private func filterFoodLogs() {
        filteredFoodLogs = [MealType: [FoodLogModel]]()
        
        for foodLog in dayLogByDate.foodLogs {
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
        .onChange(of: dayLogByDate, perform: { _ in
            filterFoodLogs()
        })
        .onAppear {
            filterFoodLogs()
        }
    }
}

struct FoodDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDiaryView(dayLogByDate: .constant(DayLogModel()))
    }
}
