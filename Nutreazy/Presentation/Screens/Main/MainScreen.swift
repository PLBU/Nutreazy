//
//  MainScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 20/11/23.
//

import SwiftUI
import RealmSwift

struct MainScreen: View {
    @ObservedResults(UserModel.self) var users
    
    var body: some View {
        VStack {
            Group {
                Text("Hai, ")
                    .font(HEADING_2)
                    .foregroundColor(TEXT_COLOR) +
                Text("\(users.first?.name.components(separatedBy: " ").first ?? "Nama") 👋\n")
                    .font(HEADING_2)
                    .foregroundColor(PRIMARY_COLOR) +
                Text("Yuk semangat diet!")
                    .font(SUBHEADING_4_ITALIC)
                    .foregroundColor(TEXT_COLOR)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.horizontal, 20)
        .padding(.top, 20)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
