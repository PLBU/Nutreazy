//
//  MainScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 20/11/23.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationStack{
            FoodLogListView()
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
