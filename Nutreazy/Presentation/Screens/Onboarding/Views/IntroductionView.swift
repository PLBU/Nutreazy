//
//  IntroductionScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import SwiftUI
import RealmSwift

struct IntroductionView: View {
    @ObservedResults(User.self) var users
    
    @State private var name: String = ""
    @State private var gender: String = ""
    @State private var age: String = ""
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var actIntesity: String = ""
    @State private var isGoingToTargetView: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
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
                    
                    DropdownField(value: $gender, label: "Gender", options: genderListID)
                    
                    ShortTextField(value: $age, label: "Umur", unitName: "tahun")
                    
                    ShortTextField(value: $height, label: "Tinggi Badan", unitName: "cm")
                    
                    ShortTextField(value: $weight, label: "Berat Badan", unitName: "kg")

                    DropdownField(value: $actIntesity, label: "Aktivitas*", options: activityIntensityListID, info: "Mageran => Tidak olahraga\nRingan => Olahraga 1-2x seminggu\nSedang => 3-5x seminggu\nBerat => 6-7x seminggu\nAtlet => 2x sehari")
                        .padding(.bottom, 16)
                }
            }
            
            CustomButton(label: "Lanjut") {
                isGoingToTargetView = true
                $users.append(User.createDummy())
            }
            .frame(alignment: .bottom)
        }
        .padding(40)
        .navigationDestination(isPresented: $isGoingToTargetView) {
            TargetView()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
