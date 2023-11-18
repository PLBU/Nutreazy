//
//  TargetView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/10/23.
//

import SwiftUI
import RealmSwift

struct TargetView: View {
    @ObservedResults(User.self) var users
    
    @State private var isGoingToInfoView: Bool = false
    
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
                    isGoingToInfoView = true
                }
                CustomButton(label: "Jaga berat badan") {
                    isGoingToInfoView = true
                }
                CustomButton(label: "Tambah gedee") {
                    isGoingToInfoView = true
                }
            }
        }
        .padding(40)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            print(users)
        })
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView()
    }
}
