//
//  FoodInfoListView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 02/12/23.
//

import SwiftUI

struct FoodInfoListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dayLogManager: DayLogManager
    @StateObject private var foodInfoManager = FoodInfoManager()
    @State private var searchKey = ""
    @State private var isShowFoodInfoDialog = false
    @State private var isShowFoodLogDialog = false
    var date: Date
    var foodInfo: FoodInfoModel? = nil

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
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Text("Makanan 🥗")
                        .font(HEADING_4)
                        .foregroundColor(TEXT_COLOR)
                }
                
                EditText(value: $searchKey, placeholder: "Cari makananmu di sini", maxLength: 40)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(foodInfoManager.foodInfos) { foodInfo in
                            FoodInfoRowView(foodInfo: foodInfo)
                                .onTapGesture {
                                    foodInfo = foodInfo
                                    isShowFoodLogDialog = true
                                }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(20)
            
            FloatingButton {
                withAnimation {
                    isShowFoodInfoDialog = true
                }
            }
            .padding(20)
            
            CustomDialog(isActive: $isShowFoodInfoDialog) {
                AddFoodInfoView(isShowDialog: $isShowFoodInfoDialog)
                    .environmentObject(foodInfoManager)
            }

            CustomDialog(isActive: $isShowFoodLogDialog) {
                AddFoodLogView(isShowDialog: $isShowFoodLogDialog, date: date, foodInfo: foodInfo!)
                    .environmentObject()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FoodInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfoListView()
    }
}
