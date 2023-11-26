//
//  SwiftUIView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 14/11/23.
//

import SwiftUI
import RealmSwift

struct StrategyView: View {
    @ObservedResults(RegisterModel.self) var register
    @ObservedResults(UserModel.self) var users
    @State private var isGoingToWelcomeView: Bool = false
    
    private func getExplanationString(name: String, calorie: Int, dietTarget: DietTarget) -> String {
        var result: String = "Agar berat badan \(name) "
        
        switch (dietTarget) {
            case .Decrease:
                result += "turun berarti asupan kalorimu setiap harinya harus di bawah \(calorie)cal. Nizy rekomen kurangin 15%."
            case .Increase:
                result += "naik berarti asupan kalorimu setiap harinya harus di atas \(calorie)cal. Nizy rekomen naikin 15%."
            default:
                result += "tetap berarti asupan kalorimu setiap harinya harus stay"
        }
        
        return result
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 40) {
                    Group {
                        Text("Maintenance Calorie kamu\n")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR) +
                        Text("\(Int(users.first?.maintenanceCalorie ?? 0))cal")
                            .font(HEADING_3)
                            .foregroundColor(TEXT_COLOR)
                    }
                    
                    Text(
                        getExplanationString(
                            name: users.first?.name ?? "",
                            calorie: Int(users.first?.maintenanceCalorie ?? 0),
                            dietTarget: users.first?.dietTarget ?? DietTarget.Maintain
                        )
                    )
                        .font(PARAGRAPH_1)
                        .foregroundColor(TEXT_COLOR)
                    
                    Group {
                        Text("Nizy coba targetin asupan kalori \(users.first?.name ?? "") di ")
                            .font(HEADING_5)
                            .foregroundColor(TEXT_COLOR) +
                        Text("\(Int(users.first?.targetCalorie ?? 0))cal")
                            .font(HEADING_3)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text(" ya")
                            .font(HEADING_5)
                            .foregroundColor(TEXT_COLOR)
                    }
                }
            }
            
            Button() {
                isGoingToWelcomeView = true
            } label : {
                Text("Ulangi onboarding")
                    .font(PARAGRAPH_2)
                    .foregroundColor(ACCENT_COLOR)
            }
            .padding(.bottom, 24)
            
            CustomButton(label: "Mulai!") {
                $register.append(RegisterModel())
            }
        }
        .padding(40)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $isGoingToWelcomeView) {
            WelcomeView()
        }
    }
}

struct StrategyView_Previews: PreviewProvider {
    static var previews: some View {
        StrategyView()
    }
}
