//
//  UserManager.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 18/11/23.
//

import Foundation
import RealmSwift

class MyUserManager {
    private(set) var localRealm: Realm?
    static let instance = MyUserManager()
    
    private init() {
        openRealm()
    }

    // Function to open a Realm (like a box) - needed for saving data inside of the Realm
    func openRealm() {
        do {
            // Setting the schema version
            let config = Realm.Configuration(schemaVersion: 1)

            Realm.Configuration.defaultConfiguration = config

            localRealm = try Realm()
        } catch {
            print("Error opening Realm", error)
        }
    }
    
    func setMyUser(user: UserModel) throws {
        do {
            try localRealm!.write {
                if let myUser = getMyUser() {
                    myUser.name = user.name
                    myUser.gender = user.gender
                    myUser.age = user.age
                    myUser.height = user.height
                    myUser.weight = user.weight
                    myUser.activity = user.activity
                    if (user.targetCalorie > 0) {
                        myUser.targetCalorie = user.targetCalorie
                    }
                    if (user.dietTarget != nil) {
                        myUser.dietTarget = user.dietTarget
                    }
                    if (user.maintenanceCalorie > 0) {
                        myUser.maintenanceCalorie = user.maintenanceCalorie
                    }
                } else {
                    localRealm!.add(user)
                }
            }
        } catch {
            print("Error setMyUser", error)
            throw error
        }
        
    }
    
    private func getMyUser() -> UserModel? {
        // Read for runtime only, for faster Declarative Reading, use @ObservedResults
        return localRealm?.objects(UserModel.self).first ?? nil
    }
    
    func setMyUserDietTarget(dietTarget: DietTarget) throws {
        do {
            try localRealm!.write {
                let myUser = getMyUser()
                myUser?.dietTarget = dietTarget
            }
        } catch {
            print("Error setMyUserDietTarget", error)
            throw error
        }
    }
}
