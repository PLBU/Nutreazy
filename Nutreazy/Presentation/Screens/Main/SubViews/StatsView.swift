//
//  StatsView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI
import RealmSwift

struct StatsView: View {
    @ObservedResults(UserModel.self) private var users
    
    @Binding var date: Date
    @Binding var foodLogsByDate: [FoodLogModel]
    
    @State private var isShowingDatePicker = false
    
    private var currCalorie: Double {
        get {
            foodLogsByDate.reduce(0) { prev, foodLog in
                prev + foodLog.calories
            }
        }
    }
    
    private var currProtein: Double {
        get {
            foodLogsByDate.reduce(0) { prev, foodLog in
                prev + foodLog.protein
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Group {
                    Text("Stats")
                        .foregroundColor(PRIMARY_COLOR) +
                    Text("-mu di")
                        .foregroundColor(TEXT_COLOR)
                }
                .font(HEADING_4)
                
                Text(date.getFormattedDate())
                    .font(HEADING_4)
                    .foregroundColor(PRIMARY_COLOR)
                    .overlay(
                        DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
                            .opacity(0.02)
                            .tint(PRIMARY_COLOR)
                            .fixedSize(horizontal: true, vertical: true)
                    )
                
                Text("📊")
                    .font(HEADING_4)
            }

            HStack(spacing: 16) {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Kalori")
//                        .font(SUBHEADING_5)
//                        .foregroundColor(TEXT_COLOR)
//
//                    Chip(text: "\(Int(currCalorie))/\(Int(users.first?.targetCalorie ?? 0))cal")
//                }
//
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Protein")
//                        .font(SUBHEADING_5)
//                        .foregroundColor(TEXT_COLOR)
//
//                    Chip(text: "\(Int(currProtein))/\(Int(users.first?.targetProtein ?? 0))g")
//                }

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
    }
}

struct StatsViiew_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(date: .constant(Date()), foodLogsByDate: .constant([]))
    }
}
