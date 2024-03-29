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
    @State private var foodLogState: FoodLogState = FoodLogState(foodInfo: FoodInfoModel())
    var date: Date

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 10) {
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

//                EditText(value: $searchKey, placeholder: "Cari makananmu di sini", maxLength: 40)
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(foodInfoManager.foodInfos) { newFoodInfo in
                            FoodInfoRow(foodInfo: newFoodInfo)
                                .onTapGesture {
                                    foodLogState = FoodLogState(foodInfo: newFoodInfo)
                                    withAnimation {
                                        isShowFoodLogDialog = true
                                    }
                                }
                        }
                    }
                }
                
                Text("[*Sumber Data](https://www.kaggle.com/datasets/anasfikrihanif/indonesian-food-and-drink-nutrition-dataset)")
                    .font(PARAGRAPH_2)
                    .foregroundColor(ACCENT_COLOR)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(10)
            
            FloatingButton {
                withAnimation {
                    isShowFoodInfoDialog = true
                }
            }
            .padding(10)
            
            CustomDialog(isActive: $isShowFoodInfoDialog) {
                AddFoodInfoView(isShowDialog: $isShowFoodInfoDialog)
                    .environmentObject(foodInfoManager)
            }

            CustomDialog(isActive: $isShowFoodLogDialog) {
                AddFoodLogView(
                    isShowDialog: $isShowFoodLogDialog,
                    foodLogState: $foodLogState,
                    date: date
                )
                .environmentObject(dayLogManager)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FoodInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfoListView(
            date: Date().withoutTime()
        )
    }
}
