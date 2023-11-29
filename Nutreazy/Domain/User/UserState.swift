//
//  UserState.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 18/11/23.
//

import Foundation

struct UserState : Equatable {
    var name: String = ""
    var gender: String = ""
    var yearBorn: String = ""
    var height: String = ""
    
    func toModel() -> UserModel {
        return UserModel(
            name: self.name,
            gender: self.gender == genderListID[0]
                ? Gender.Male
                : Gender.Female,
            yearBorn: Int(self.yearBorn) ?? 0,
            height: Int(self.height) ?? 0
        )
    }
    
    func isValid() -> Bool {
        return !name.isEmpty && !gender.isEmpty && !yearBorn.isEmpty && !height.isEmpty
    }
}
