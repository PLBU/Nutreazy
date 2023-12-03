//
//  FoodInfoManager.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 03/12/23.
//

import Foundation
import RealmSwift

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
    
    func getFoodInfos() {
        if let localRealm = localRealm {
            let allFoodInfos = localRealm.objects(FoodInfoModel.self)
            
            foodInfos = []
            
            allFoodInfos.forEach { foodInfo in
                foodInfos.append(foodInfo)
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
