//
//  DayLogManager.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 26/11/23.
//

import Foundation
import RealmSwift

class DayLogManager {
    private(set) var localRealm: Realm?
    static let instance = DayLogManager()
    
    private init() {
        openRealm()
    }

    func openRealm() {
        do {
            Realm.Configuration.defaultConfiguration = globalRealmConfig
            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func getCurrentDayLog(date: Date = Date().withoutTime()) -> DayLogModel? {
        return localRealm?.objects(DayLogModel.self).where({
            $0.date == date
        }).first
    }
    
    func getLastDayLog(date: Date = Date().withoutTime()) -> DayLogModel? {
        return localRealm?.objects(DayLogModel.self)
            .where({ $0.date <= date })
            .sorted(byKeyPath: "date", ascending: false).first
    }
    
    func addCurrentDayLog(
        dayLog: DayLogModel,
        date: Date = Date().withoutTime()
    ) throws {
        do {
            if (getCurrentDayLog(date: date) == nil) {
                try localRealm!.write {
                    localRealm!.add(dayLog)
                }
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
            if let currDayLog = getCurrentDayLog(date: date) {
                try localRealm!.write {
                    if let weight = weight {
                        currDayLog.weight = weight
                    }
                    
                    if let activityIntensity = activityIntensity {
                        currDayLog.activityIntensity = activityIntensity
                    }

                    if let dietTarget = dietTarget {
                        currDayLog.dietTarget = dietTarget
                    }
                    
                    if let targetProtein = targetProtein {
                        currDayLog.targetProtein = targetProtein
                    }
                    
                    if let targetCalorie = targetCalorie {
                        currDayLog.targetCalorie = targetCalorie
                    }
                    
                    if let maintenanceCalorie = maintenanceCalorie {
                        currDayLog.maintenanceCalorie = maintenanceCalorie
                    }
                }
            }
        } catch {
            print("Error setCurrentDayLog", error)
            throw error
        }
    }
}
