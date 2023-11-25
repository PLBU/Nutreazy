//
//  FoodLogListView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 22/11/23.
//

import SwiftUI
import RealmSwift

struct FoodLogListView: View {
    @ObservedResults(UserModel.self) var users
    @ObservedResults(FoodLogModel.self) var foodLogs
    
    @State private var date: Date = Date().withoutTime()
    @State private var filteredFoodLogs = [MealType: [FoodLogModel]]()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 32) {
                Group {
                    Text("Hai, ")
                        .font(HEADING_2)
                        .foregroundColor(TEXT_COLOR) +
                    Text("\(users.first?.name.components(separatedBy: " ").first ?? "Nama") 👋\n")
                        .font(HEADING_2)
                        .foregroundColor(PRIMARY_COLOR) +
                    Text("Yuk semangat diet!")
                        .font(SUBHEADING_4_ITALIC)
                        .foregroundColor(TEXT_COLOR)
                }

                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        Text("Stats")
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("-mu ")
                            .foregroundColor(TEXT_COLOR) +
                        Text("hari ini")
                            .underline()
                            .foregroundColor(TEXT_COLOR) +
                        Text(" 📊")
                    }
                    .font(HEADING_4)

                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Kalori")
                                .font(SUBHEADING_5)
                                .foregroundColor(TEXT_COLOR)

                            Chip(text: "2300/2500cal")
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Protein")
                                .font(SUBHEADING_5)
                                .foregroundColor(TEXT_COLOR)

                            Chip(text: "65/130g")
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Berat")
                                .font(SUBHEADING_5)
                                .foregroundColor(TEXT_COLOR)

                            Chip(text: "65kg")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(PRIMARY_COLOR, lineWidth: 1)
                    )
                }

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
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(PRIMARY_COLOR, lineWidth: 1)
                        )
                        .padding(.bottom, 20)
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            FloatingButton(
                secondaryButtons: [
                    ExpandableButtonItem(
                        label: Image(systemName: "scalemass.fill"),
                        action: { print("I am clicked 3") }
                    ),
                    ExpandableButtonItem(
                        label: Image(systemName: "fork.knife"),
                        action: { print("I am clicked 2") }
                    )
                ]
            ) {}
            .padding(20)
        }
        .onAppear {            
            for foodLog in foodLogs.where({ $0.date == date }) {
                if filteredFoodLogs.keys.contains(foodLog.mealType!) {
                    filteredFoodLogs[foodLog.mealType!]!.append(foodLog)
                } else {
                    filteredFoodLogs[foodLog.mealType!] = [foodLog]
                }
            }
        }
    }
}

struct FoodLogListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogListView()
    }
}
