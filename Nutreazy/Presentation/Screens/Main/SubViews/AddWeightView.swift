//
//  AddWeightView.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 01/12/23.
//

import SwiftUI

struct AddWeightView: View {
    @Binding var date: Date
    @Binding var isShowDialog: Bool
    @State var weight: String = ""
    @State var isShowAlert: Bool = false
    
    private func handleAddWeightToDayLog() {
        do {
            if let currDayLog = DayLogManager.instance.getCurrentDayLog(date: date) {
                try DayLogManager.instance.setCurrentDayLog(
                    date: date,
                    weight: Double(weight)
                )
            } else {
                try DayLogManager.instance.addCurrentDayLog(
                    dayLog: DayLogModel(
                        date: date,
                        weight: Double(weight)
                    )
                )
            }
        } catch {
            isShowDialog = true
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Tambah Berat Badan")
                .font(HEADING_5)
                .foregroundColor(TEXT_COLOR)
            
            DoubleEditText(value: $weight, unitName: "kg", width: 100, isCenter: true, maxLength: 3)
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
    }
}
