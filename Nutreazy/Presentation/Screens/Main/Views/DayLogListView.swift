//
//  DayLogListView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 22/11/23.
//

import SwiftUI
import RealmSwift

struct DayLogListView: View {
    @EnvironmentObject var dayLogManager: DayLogManager
    @ObservedResults(UserModel.self) private var users
    
    @State private var date: Date = Date().withoutTime()
    @State private var isShowAddWeightDialog: Bool = false
    @State private var isGoingToFoodInfoListView: Bool = false
    
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

                    StatsView(date: $date)
                        .environmentObject(dayLogManager)
                    
                    FoodDiaryView()
                        .environmentObject(dayLogManager)
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
                        action: {
                            isGoingToFoodInfoListView = true
                        }
                    )
                ]
            ) {}
            .padding(20)
            
            CustomDialog(isActive: $isShowAddWeightDialog) {
                AddWeightView(date: $date, isShowDialog: $isShowAddWeightDialog)
            }
        }
        .onChange(of: date, perform: { _ in
            dayLogManager.getCurrentDayLog(date: date)
        })
        .navigationDestination(isPresented: $isGoingToFoodInfoListView) {
            FoodInfoListView(date: date)
                .environmentObject(dayLogManager)
        }
    }
}

struct FoodLogListView_Previews: PreviewProvider {
    static var previews: some View {
        DayLogListView()
    }
}
