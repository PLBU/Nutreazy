//
//  DayLogManager.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 26/11/23.
//

import Foundation
import RealmSwift

class DayLogManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published var dayLog: DayLogModel = DayLogModel()
    @Published var foodLogs: [FoodLogModel] = []
    
    init() {
        openRealm()
        getCurrentDayLog()
    }

    private func openRealm() {
        do {
            Realm.Configuration.defaultConfiguration = globalRealmConfig
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func getCurrentDayLog(date: Date = Date().withoutTime()) {
        if let currDayLog = localRealm?.objects(DayLogModel.self).where({
            $0.date == date
        }).first {
            foodLogs = []
            dayLog = currDayLog
            dayLog.foodLogs.forEach {
                foodLogs.append($0)
            }
        } else {
            if let lastDayLog = getLastDayLog(date: date) {
                dayLog = DayLogModel(
                    date: date,
                    activityIntensity: lastDayLog.activityIntensity,
                    targetProtein: lastDayLog.targetProtein,
                    targetCalorie: lastDayLog.targetCalorie,
                    maintenanceCalorie: lastDayLog.maintenanceCalorie,
                    dietTarget: lastDayLog.dietTarget
                )
            } else {
                dayLog = DayLogModel()
            }
            
            foodLogs = []
        }
    }
    
    private func isCurrentDayLogExist(date: Date = Date().withoutTime()) -> Bool {
        return localRealm?.objects(DayLogModel.self).where({
            $0.date == date
        }).first != nil
    }
    
    private func getLastDayLog(date: Date = Date().withoutTime()) -> DayLogModel? {
        return localRealm?.objects(DayLogModel.self)
            .where({ $0.date <= date })
            .sorted(byKeyPath: "date", ascending: false).first
    }
    
    func addCurrentDayLog(
        dayLog: DayLogModel,
        date: Date = Date().withoutTime()
    ) throws {
        do {
            try localRealm!.write {
                localRealm!.add(dayLog)
                getCurrentDayLog(date: date)
            }
        } catch {
            print("Error addCurrentDayLog", error)
            throw error
        }
    }
    
    func setCurrentDayLog(
        date: Date = Date().withoutTime(),
        weight: Double? = nil,
        activityIntensity: ActivityIntensity? = nil,
        targetProtein: Double? = nil,
        targetCalorie: Double? = nil,
        maintenanceCalorie: Double? = nil,
        dietTarget: DietTarget? = nil
    ) throws {
        do {
            if isCurrentDayLogExist(date: date) {
                getCurrentDayLog(date: date)
                
                try localRealm!.write {
                    if let weight = weight {
                        dayLog.weight = weight
                    }
                    
                    if let activityIntensity = activityIntensity {
                        dayLog.activityIntensity = activityIntensity
                    }

                    if let dietTarget = dietTarget {
                        dayLog.dietTarget = dietTarget
                    }
                    
                    if let targetProtein = targetProtein {
                        dayLog.targetProtein = targetProtein
                    }
                    
                    if let targetCalorie = targetCalorie {
                        dayLog.targetCalorie = targetCalorie
                    }
                    
                    if let maintenanceCalorie = maintenanceCalorie {
                        dayLog.maintenanceCalorie = maintenanceCalorie
                    }
                }
                
                getCurrentDayLog(date: date)
            } else {
                let lastDayLog = getLastDayLog(date: date)
                
                try addCurrentDayLog(
                    dayLog: DayLogModel(
                        date: date,
                        weight: weight,
                        activityIntensity: activityIntensity ?? lastDayLog?.activityIntensity,
                        targetProtein: targetProtein ?? lastDayLog?.targetProtein,
                        targetCalorie: targetCalorie ?? lastDayLog?.targetCalorie,
                        maintenanceCalorie: maintenanceCalorie ?? lastDayLog?.maintenanceCalorie,
                        dietTarget: dietTarget ?? lastDayLog?.dietTarget
                    )
                )
                
                getCurrentDayLog(date: date)
            }
        } catch {
            print("Error setCurrentDayLog", error)
            throw error
        }
    }

    func addCurrentDayFoodLog(
        date: Date = Date().withoutTime(),
        foodLog: FoodLogModel
    ) throws {
        do {
            if isCurrentDayLogExist(date: date) {
                let currDayLog = localRealm?.objects(DayLogModel.self).where({
                    $0.date == date
                }).first
                
                try localRealm!.write {
                    currDayLog!.foodLogs.append(foodLog)
                }
                
                getCurrentDayLog(date: date)
            } else {
                let lastDayLog = getLastDayLog(date: date)
                let newDayLog = DayLogModel(
                    date: date,
                    activityIntensity: lastDayLog?.activityIntensity,
                    targetProtein: lastDayLog?.targetProtein,
                    targetCalorie: lastDayLog?.targetCalorie,
                    maintenanceCalorie: lastDayLog?.maintenanceCalorie,
                    dietTarget: lastDayLog?.dietTarget
                )
                
                newDayLog.foodLogs.append(foodLog)
                
                try addCurrentDayLog(
                    dayLog: newDayLog
                )
                
                getCurrentDayLog(date: date)
            }
        } catch {
            print("Error addCurrentDayFoodLog", error)
            throw error
        }
    }
    
    func updateCurrentDayFoodLog(
        date: Date = Date().withoutTime(),
        foodLog: FoodLogModel,
        newFoodLog: FoodLogModel
    ) throws {
        do {
            try localRealm!.write {
                let currDayLog = localRealm?.objects(DayLogModel.self).where({
                    $0.date == date
                }).first
                
                let index = currDayLog!.foodLogs.index(of: foodLog)
                currDayLog!.foodLogs[index!] = newFoodLog
                
                getCurrentDayLog(date: date)
            }
        } catch {
            print("Error update foodLog")
        }
    }

    func deleteCurrentDayFoodLog(
        date: Date = Date().withoutTime(),
        foodLog: FoodLogModel
    ) throws {
        do {
            try localRealm!.write {
                let currDayLog = localRealm?.objects(DayLogModel.self).where({
                    $0.date == date
                }).first
                
                let index = currDayLog!.foodLogs.index(of: foodLog)
                currDayLog!.foodLogs.remove(at: index!)
                
                getCurrentDayLog(date: date)
            }
        } catch {
            print("Error delete foodLog")
        }
    }
}
