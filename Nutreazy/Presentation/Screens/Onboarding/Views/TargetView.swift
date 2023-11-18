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
    @State private var isShowAlert: Bool = false
    @State private var isGoingToInfoView: Bool = false
    
    private func updateDietTarget(dietTarget: DietTarget) {
        do {
            let realm = try Realm()
            try realm.write {
                let myUser = realm.objects(UserModel.self).first
                
                myUser?.dietTarget = dietTarget
                isGoingToInfoView = true
            }
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
                Text("Renaldi\napa nih?")
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
        .toast(isPresenting: $isShowAlert) {
            AlertToast(type: .regular, title: "Terjadi kesalahan!")
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
