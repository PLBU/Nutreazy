//
//  WelcomeScreeen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 23/10/23.
//

import SwiftUI


struct WelcomeView: View {
    @State private var isGoingToIntroView: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    Group {
                        Text("NutrEazy:\n")
                            .font(HEADING_1)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("Diet lebih\n")
                            .font(HEADING_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("eazy 🥗")
                            .font(HEADING_1)
                            .foregroundColor(PRIMARY_COLOR)
                    }
                    
                    Text("Hai!")
                        .font(HEADING_5)
                        .foregroundColor(TEXT_COLOR)
                    
                    Group {
                        Text("Selamat datang di perjalanan dietmu! Aku Nutreazy atau ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("Nizy ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text("singkatnya.")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR)
                    }
                    
                    Text("Nizy tahu kamu pasti sudah siap untuk hidup lebih sehat dan happy 😁.")
                        .font(PARAGRAPH_1)
                        .foregroundColor(TEXT_COLOR)
                    
                    Group {
                        Text("Diet sekarang tidak harus membosankan dan sulit. Nizy akan buat perjalanan ini seru dan ")
                            .font(PARAGRAPH_1)
                            .foregroundColor(TEXT_COLOR) +
                        Text("eazy!")
                            .font(PARAGRAPH_1)
                            .foregroundColor(PRIMARY_COLOR)
                    }
                }
            }
            
            CustomButton(label: "Yuk kita mulai diet!") {
                isGoingToIntroView = true
            }
        }
        .padding(20)
        .navigationDestination(isPresented: $isGoingToIntroView) {
            IntroductionView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
