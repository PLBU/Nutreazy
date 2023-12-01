//
//  DayLogListView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 22/11/23.
//

import SwiftUI
import RealmSwift

struct DayLogListView: View {
    @ObservedResults(UserModel.self) private var users
    @ObservedResults(DayLogModel.self) private var dayLogs
    
    @State private var date: Date = Date().withoutTime()
    @State private var dayLogByDate: DayLogModel = DayLogModel()
    @State private var isShowAddWeightDialog: Bool = false
    
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

                    StatsView(date: $date, dayLogByDate: $dayLogByDate)
                    
                    FoodDiaryView(dayLogByDate: $dayLogByDate)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            
            FloatingButton(
                secondaryButtons: [
                    ExpandableButtonItem(
                        label: Image(systemName: "scalemass.fill"),
                        action: {
                            withAnimation {
                                isShowAddWeightDialog = true
                            }
                        }
                    ),
                    ExpandableButtonItem(
                        label: Image(systemName: "fork.knife"),
                        action: { print("I am clicked 2") }
                    )
                ]
            ) {}
            .padding(20)
            
            CustomDialog(isActive: $isShowAddWeightDialog) {
                AddWeightView(date: $date, isShowDialog: $isShowAddWeightDialog)
            }
        }
        .onChange(of: date, perform: { _ in
            dayLogByDate = dayLogs.where({ $0.date == date.withoutTime() }).first ?? DayLogModel(date: date.withoutTime())
        })
        .onAppear {
            dayLogByDate = dayLogs.where({ $0.date == date.withoutTime() }).first ?? DayLogModel()
        }
    }
}

struct FoodLogListView_Previews: PreviewProvider {
    static var previews: some View {
        DayLogListView()
    }
}
