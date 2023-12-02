//
//  NutreazyApp.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import SwiftUI
import RealmSwift

@main
struct NutreazyApp: SwiftUI.App {
    @ObservedResults(RegisterModel.self) var register
    @StateObject var dayLogManager = DayLogManager()
    
    var body: some Scene {
        WindowGroup {
            if (register.first != nil) {
                MainScreen()
            } else {
                OnboardingScreen()
                    .environmentObject(dayLogManager)
            }
        }
    }
}
