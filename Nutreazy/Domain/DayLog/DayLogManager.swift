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
}
