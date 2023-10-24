//
//  OnboardingScreen.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 24/10/23.
//

import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        NavigationStack{
            WelcomeView()
        }
    }
}

struct OnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen()
    }
}
