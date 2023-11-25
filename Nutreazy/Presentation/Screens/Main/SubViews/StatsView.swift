//
//  StatsView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
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
    }
}

struct StatsViiew_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
