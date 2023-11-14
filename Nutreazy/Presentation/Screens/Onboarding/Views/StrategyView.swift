//
//  SwiftUIView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 14/11/23.
//

import SwiftUI

struct StrategyView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 40) {
                    Group {
                        Text("Maintenance Calorie kamu\n")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR) +
                        Text("2500 cal")
                            .font(HEADING_2)
                            .foregroundColor(PRIMARY_COLOR)
                    }
                    
                    Text("Agar berat badan [Renaldi] [turun] berarti asupan kalorimu setiap harinya harus di bawah 2500cal")
                        .font(PARAGRAPH_1)
                        .foregroundColor(TEXT_COLOR)
                    
                    Group {
                        Text("Nizy coba targetin asupan kalori [Renaldi] di ")
                            .font(HEADING_5)
                            .foregroundColor(TEXT_COLOR) +
                        Text("2500 cal")
                            .font(HEADING_5)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text(" ya")
                            .font(HEADING_5)
                            .foregroundColor(TEXT_COLOR)
                    }
                }
            }
            
            CustomButton(label: "Mulai!") {
                
            }
        }
        .padding(40)
    }
}

struct StrategyView_Previews: PreviewProvider {
    static var previews: some View {
        StrategyView()
    }
}
