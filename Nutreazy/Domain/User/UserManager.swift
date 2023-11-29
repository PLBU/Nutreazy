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

    func openRealm() {
        do {
            Realm.Configuration.defaultConfiguration = globalRealmConfig
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
                    myUser.yearBorn = user.yearBorn
                    myUser.height = user.height
                } else {
                    localRealm!.add(user)
                }
            }
        } catch {
            print("Error setMyUser", error)
            throw error
        }
        
    }
    
    func getMyUser() -> UserModel? {
        // Better read for runtime only, for faster Declarative Reading, use @ObservedResults
        return localRealm?.objects(UserModel.self).first ?? nil
    }
}
