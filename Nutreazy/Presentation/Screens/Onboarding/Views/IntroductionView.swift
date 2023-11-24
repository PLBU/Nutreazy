//
//  IntroductionScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import SwiftUI
import RealmSwift

struct IntroductionView: View {
    @State private var userState: UserState = UserState()
    @State private var isButtonEnabled: Bool = false
    @State private var isGoingToTargetView: Bool = false
    @State private var isShowAlert: Bool = false
    
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
                    
                    LongStringTextField(value: $userState.name, label: "Nama kamu siapa?", placeholder: "Nama kamu", maxLength: 20)
                        .padding(.top, 24)
                    
                    DropdownField(value: $userState.gender, label: "Gender", options: genderListID)
                    
                    IntTextField(value: $userState.age, label: "Umur", unitName: "tahun", maxLength: 3)
                    
                    IntTextField(value: $userState.height, label: "Tinggi Badan", unitName: "cm", maxLength: 3)
                    
                    DoubleTextField(value: $userState.weight, label: "Berat Badan", unitName: "kg", maxLength: 5)
                    
                    DropdownField(value: $userState.actIntesity, label: "Aktivitas*", options: activityIntensityListID, info: "Mageran => Tidak olahraga\nRingan => Olahraga 1-2x seminggu\nSedang => 3-5x seminggu\nBerat => 6-7x seminggu\nAtlet => 2x sehari")
                        .padding(.bottom, 16)
                }
                .onChange(of: userState) { _ in
                    isButtonEnabled = userState.isValid()
                }
            }
            
            CustomButton(label: "Lanjut", isEnabled: $isButtonEnabled) {
                do {
                    try MyUserManager.instance.setMyUser(user: userState.toModel())
                    isGoingToTargetView = true
                } catch {
                    isShowAlert = true
                }
            }
            .frame(alignment: .bottom)
        }
        .alert("Terjadi kesalahan", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) { }
        }
        .onAppear() {
            if let myUser = MyUserManager.instance.getMyUser() {
                userState = myUser.toState()
            }
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
