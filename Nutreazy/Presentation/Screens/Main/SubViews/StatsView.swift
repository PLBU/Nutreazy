//
//  StatsView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI
import RealmSwift

struct StatsView: View {
    @Binding var date: Date
    @Binding var dayLogByDate: DayLogModel
    
    @State private var isShowingDatePicker = false
    
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
                VStack(alignment: .leading, spacing: 8) {
                    Text("Kalori")
                        .font(SUBHEADING_5)
                        .foregroundColor(TEXT_COLOR)

                    Chip(text: "\(Int(dayLogByDate.currentCalorie))/\(Int(dayLogByDate.targetCalorie))cal")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Protein")
                        .font(SUBHEADING_5)
                        .foregroundColor(TEXT_COLOR)

                    Chip(text: "\(Int(dayLogByDate.currentProtein))/\(Int(dayLogByDate.targetProtein))g")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Berat")
                        .font(SUBHEADING_5)
                        .foregroundColor(TEXT_COLOR)

                    Chip(text: "\(dayLogByDate.weight)kg")
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
        StatsView(date: .constant(Date()), dayLogByDate: .constant(DayLogModel()))
    }
}