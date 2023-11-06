//
//  InfoView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/10/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 28) {
                    Group {
                        Text("Biar targetmu tercapai, cobain:\n")
                            .font(HEADING_2)
                            .foregroundColor(TEXT_COLOR) +
                        Text("Calorie Tracking!")
                            .font(HEADING_2)
                            .foregroundColor(PRIMARY_COLOR)
                    }
                    
                    
                }
            }
            
            CustomButton(label: "Yuk kita mulai diet!") {
                
            }
        }
        .padding(40)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
