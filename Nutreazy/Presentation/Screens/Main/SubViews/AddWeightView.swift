//
//  AddWeightView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 01/12/23.
//

import SwiftUI

struct AddWeightView: View {
    @EnvironmentObject var dayLogManager: DayLogManager
    @Binding var date: Date
    @Binding var isShowDialog: Bool
    @State var weight: String = ""
    @State var isShowAlert: Bool = false
    
    private func handleAddWeightToDayLog() {
        do {
            try dayLogManager.setCurrentDayLog(
                date: date,
                weight: Double(weight)
            )
            
            weight = ""
        } catch {
            isShowDialog = true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Tambah Berat Badan")
                .font(HEADING_5)
                .foregroundColor(TEXT_COLOR)
            
            DoubleEditText(value: $weight, unitName: "kg", width: 100, isCenter: true, maxLength: 6)
                .frame(maxWidth: .infinity)
            
            CustomButton(label: "Tambah") {
                handleAddWeightToDayLog()
                withAnimation {
                    isShowDialog = false
                }
            }
        }
        .alert("Terjadi kesalahan", isPresented: $isShowAlert) {
            Button("Ok", role: .cancel) {}
        }
    }
}

struct AddWeightDialog_Previews: PreviewProvider {
    static var previews: some View {
        AddWeightView(date: .constant(Date()), isShowDialog: .constant(true))
            .environmentObject(DayLogManager())
    }
}
