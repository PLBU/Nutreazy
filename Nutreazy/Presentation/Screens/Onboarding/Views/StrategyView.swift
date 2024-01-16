//
//  SwiftUIView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 14/11/23.
//

import SwiftUI
import RealmSwift

struct StrategyView: View {
    @StateObject private var dayLogManager = DayLogManager()
    @ObservedResults(RegisterModel.self) var register
    @ObservedResults(UserModel.self) var users
    @State private var isGoingToWelcomeView: Bool = false
    @State private var isShowAlert: Bool = false
    
    var currDayLog: DayLogModel
    
    private func getExplanationString(name: String, maintenanceCal: Int, dietTarget: DietTarget) -> String {
        var result: String = "Agar berat badan \(name) "
        
        switch (dietTarget) {
            case .Decrease:
                result += "turun berarti asupan kalorimu setiap harinya harus di bawah \(maintenanceCal)cal. Nizy rekomen kurangin 15%."
            case .Increase:
                result += "naik berarti asupan kalorimu setiap harinya harus di atas \(maintenanceCal)cal. Nizy rekomen naikin 15%."
            default:
                result += "tetap berarti asupan kalorimu setiap harinya harus stay"
        }
        
        return result
    }
    
    private func registerLocally() {
        do {
            try dayLogManager.addCurrentDayLog(dayLog: currDayLog)
            $register.append(RegisterModel())
        } catch {
            isShowAlert = true
        }
    }
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        Text("Maintenance Calorie kamu\n")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR) +
                        Text("\(Int(currDayLog.maintenanceCalorie))cal")
                            .font(HEADING_3)
                            .foregroundColor(TEXT_COLOR)
                    }
                    
                    Text(
                        getExplanationString(
                            name: users.first?.name ?? "",
                            maintenanceCal: Int(currDayLog.maintenanceCalorie),
                            dietTarget: currDayLog.dietTarget
                        )
                    )
                        .font(PARAGRAPH_1)
                        .foregroundColor(TEXT_COLOR)
                    
                    Group {
                        Text("Nizy coba targetin asupan kalori \(users.first?.name ?? "") di ")
                            .font(HEADING_5)
                            .foregroundColor(TEXT_COLOR) +
                        Text("\(Int(currDayLog.targetCalorie))cal")
                            .font(HEADING_3)
                            .foregroundColor(PRIMARY_COLOR) +
                        Text(" ya")
                            .font(HEADING_5)
                            .foregroundColor(TEXT_COLOR)
                    }
                    
                    Text("[*Dihitung menggunakan Mifflin-St Jeor Formula](https://pubmed.ncbi.nlm.nih.gov/2305711/)")
                        .font(PARAGRAPH_2)
                        .foregroundColor(ACCENT_COLOR)
                }
            }
            
            Button() {
                isGoingToWelcomeView = true
            } label : {
                Text("Ulangi onboarding")
                    .font(PARAGRAPH_2)
                    .foregroundColor(ACCENT_COLOR)
            }
            .padding(.bottom, 12)
            
            CustomButton(label: "Mulai!") { registerLocally() }
        }
        .padding(20)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $isGoingToWelcomeView) {
            WelcomeView()
        }
        .alert("Terjadi kesalahan", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) {
                isShowAlert = false
            }
        }
    }
}

struct StrategyView_Previews: PreviewProvider {
    static var previews: some View {
        StrategyView(currDayLog: DayLogModel())
    }
}
