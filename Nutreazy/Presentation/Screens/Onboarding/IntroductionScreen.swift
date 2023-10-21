//
//  IntroductionScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import SwiftUI

struct IntroductionScreen: View {
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Group {
                        Text("Pertama, Nizy ")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR) +
                        Text("kenalan ")
                            .font(HEADING_2)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("sama kamu dulu ya 👋")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR)
                    }
                        
                    LongTextField(value: $name, label: "Nama kamu siapa?", placeholder: "Nama kamu")
                        .padding(.top, 24)
                    
                    DropdownField(value: $name, label: "Gender", options: ["String"])
                    
                    ShortTextField(value: $name, label: "Umur", unitName: "tahun")
                    
                    ShortTextField(value: $name, label: "Tinggi Badan", unitName: "cm")
                    
                    ShortTextField(value: $name, label: "Berat Badan", unitName: "kg")

                    DropdownField(value: $name, label: "Aktivitas", options: ["String"])
                }
            }

            
            CustomButton(label: "Lanjut") {
                print(name)
            }
            .frame(alignment: .bottom)
        }
        .padding(40)
    }
}

struct IntroductionScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionScreen()
    }
}
