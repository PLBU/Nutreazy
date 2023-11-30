//
//  TargetView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/10/23.
//

import SwiftUI
import RealmSwift
import AlertToast

struct TargetView: View {
    @ObservedResults(UserModel.self) var users
    @State private var isShowAlert: Bool = false
    @State private var isGoingToInfoView: Bool = false
    
    private func updateDietTarget(dietTarget: DietTarget) {
        do {
            try DayLogManager.instance.setCurrentDayLog(dietTarget: dietTarget)
            if let currDayLog = DayLogManager.instance.getCurrentDayLog() {
                currDayLog.setMaintenanceCalorie()
                currDayLog.setTargetCalorie()
                currDayLog.setTargetProtein()
            }
            isGoingToInfoView = true
        } catch {
            isShowAlert = true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("Target 🎯\n")
                    .font(HEADING_1)
                    .foregroundColor(PRIMARY_COLOR) +
                Text("\(users.first?.name ?? "")\napa nih?")
                    .font(HEADING_1)
                    .foregroundColor(TEXT_COLOR)
            }
            
            Spacer()
            
            VStack(spacing: 32) {
                CustomButton(label: "Kurusan nihh") {
                    updateDietTarget(dietTarget: DietTarget.Decrease)
                }
                CustomButton(label: "Jaga berat badan") {
                    updateDietTarget(dietTarget: DietTarget.Maintain)
                }
                CustomButton(label: "Get BIGger") {
                    updateDietTarget(dietTarget: DietTarget.Increase)
                }
            }
        }
        .alert("Terjadi kesalahan", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) { }
        }
        .padding(40)
        .navigationDestination(isPresented: $isGoingToInfoView) {
            InfoView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView()
    }
}
