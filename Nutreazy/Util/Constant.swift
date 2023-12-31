//
//  Constant.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 22/10/23.
//

import Foundation
import RealmSwift

let genderListID = ["Pria", "Wanita"]
let activityIntensityListID = ["Mageran", "Ringan", "Sedang", "Tinggi", "Atlet"]
let mealTypeListID = ["Sarapan", "Brunch", "Makan Siang", "Makan Malam", "Snack", "Tambahan"]

// Global Realm Config
let newSchemaVersion: UInt64 = 0
let globalRealmConfig = Realm.Configuration(
    schemaVersion: newSchemaVersion,
    migrationBlock: { migration, oldSchemaVersion in
        if (oldSchemaVersion < newSchemaVersion) {
            // Handle the migration manually, if you rename, remove, or change dataType
            // if only add property, should be not needed, automatically will be changed by Realm
        }
    }
)
