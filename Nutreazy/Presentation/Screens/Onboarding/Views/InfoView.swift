//
//  InfoView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/10/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    Group {
                        Text("Biar targetmu tercapai, cobain:\n")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR) +
                        Text("Calorie Tracking!")
                            .font(HEADING_2)
                            .foregroundColor(PRIMARY_COLOR)
                    }
                    
                    Group {
                        Text("Caranya mudah!\n1. ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("Timbang ")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("makananmu, atau diperkirakan\n2. Catat di ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("Nutreazy")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text(", selesai!")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR)
                    }
                    
                    Group {
                        Text("Apa itu ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("Calorie")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("?\nCalorie adalah ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("energi ⚡️")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("untuk kita hidup. Makanan yang kita konsumsi mengandung kalori")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR)
                    }
                    
                    Group {
                        Text("Sekarang yang susah, itu gimana caranya supaya ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("asupan calorie ")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("[Renaldi] ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("tidak melebihi ")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("energi rata-rata yang keluar dalam berkehidupan sehari-hari atau ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("maintenance calorie")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR)
                    }
                    
                    Group {
                        Text("Cara Nizy adalah sering makan makanan ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("rendah kalori ")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("seperti buah-buahan sambil ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("catat ")
                            .font(PARAGRAPH_1_MEDIUM)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("agar kamu bisa tahu berapa banyak kalori yang dapat dikonsumsi lagi")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR)
                    }
                }
            }
            
            CustomButton(label: "Lanjut!") {
                
            }
        }
        .padding(40)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
