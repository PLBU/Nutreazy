//
//  FoodInfoManager.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 03/12/23.
//

import Foundation
import RealmSwift
import SwiftCSV

class FoodInfoManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var foodInfos: [FoodInfoModel] = []
    
    init() {
        openRealm()
        getFoodInfos()
    }
    
    private func openRealm() {
        do {
            Realm.Configuration.defaultConfiguration = globalRealmConfig
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func getCSVDataFirstTime() {
        do {
            let csv = try CSV<Named>(
                name: "nutrients",
                extension: "csv",
                bundle: .main,
                encoding: .utf8
            )
            
            try localRealm!.write {
                for row in csv!.rows {
                    print(row)
                    localRealm!.add(
                        FoodInfoModel(
                            name: row["name"] ?? "",
                            servingName: "g",
                            servingSize: 100,
                            calories: Double(row["calories"] ?? "") ?? 0,
                            carbohydrate: Double(row["carbohydrate"] ?? "") ?? 0,
                            protein: Double(row["proteins"] ?? "") ?? 0,
                            fat: Double(row["fat"] ?? "") ?? 0
                        )
                    )
                }
            }
            
            getFoodInfos()
        } catch {
            print("Error reading CSV file: \(error.localizedDescription)")
        }
    }
    
    func getFoodInfos() {
        if let localRealm = localRealm {
            let allFoodInfos = localRealm.objects(FoodInfoModel.self)
            
            foodInfos = []
            
            allFoodInfos.forEach { foodInfo in
                foodInfos.append(foodInfo)
            }
            
            if foodInfos.isEmpty {
                getCSVDataFirstTime()
            }
        }
    }
    
    func addFoodInfo(foodInfo: FoodInfoModel) throws {
        do {
            try localRealm!.write {
                localRealm!.add(foodInfo)
                getFoodInfos()
            }
        } catch {
            print("Error addFoodInfo", error)
            throw error
        }
    }
}
