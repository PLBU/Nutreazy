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
        }).first ?? nil
    }
    
    func addCurrentDayLog(
        dayLog: DayLogModel,
        date: Date = Date().withoutTime()
    ) throws {
        do {
            if (getCurrentDayLog(date: date) != nil) {
                try localRealm!.write {
                    localRealm!.add(dayLog)
                }
            }
        } catch {
            print("Error addCurrentDayLog", error)
            throw error
        }
    }
}
