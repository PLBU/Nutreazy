//
//  FoodLogListView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 22/11/23.
//

import SwiftUI
import RealmSwift

struct FoodLogListView: View {
    @ObservedResults(UserModel.self) private var users
    @ObservedResults(FoodLogModel.self) private var foodLogs
    
    @State private var date: Date = Date().withoutTime()
    @State private var foodLogsByDate: [FoodLogModel] = []
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
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

                    StatsView(date: $date, foodLogsByDate: $foodLogsByDate)

                    FoodDiaryView(foodLogsByDate: $foodLogsByDate)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            
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
        .onChange(of: date, perform: { _ in
            foodLogsByDate = Array(foodLogs.where({ $0.date == date }))
        })
        .onAppear {
            foodLogsByDate = Array(foodLogs.where({ $0.date == date }))
        }
    }
}

struct FoodLogListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodLogListView()
    }
}
