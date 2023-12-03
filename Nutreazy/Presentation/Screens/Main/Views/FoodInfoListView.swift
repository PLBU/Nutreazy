//
//  FoodInfoListView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct FoodInfoListView: View {
    @StateObject private var foodInfoManager = FoodInfoManager()
    @State private var searchKey = ""
    @State private var isShowDialog = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 20) {
                    Image(systemName: "chevron.left")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(TEXT_COLOR)
                    Text("Makanan 🥗")
                        .font(HEADING_4)
                        .foregroundColor(TEXT_COLOR)
                }
                
                EditText(value: $searchKey, placeholder: "Cari makananmu di sini", maxLength: 40)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(20)
            
            FloatingButton {
                withAnimation {
                    isShowDialog = true
                }
            }
            .padding(20)
            
            CustomDialog(isActive: $isShowDialog) {
                AddFoodInfoView(isShowDialog: $isShowDialog)
                    .environmentObject(foodInfoManager)
            }
        }
    }
}

struct FoodInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfoListView()
    }
}
