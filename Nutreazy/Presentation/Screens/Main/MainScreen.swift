//
//  MainScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 20/11/23.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var dayLogManager = DayLogManager()
    
    var body: some View {
        NavigationStack{
            DayLogListView()
                .environmentObject(dayLogManager)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
