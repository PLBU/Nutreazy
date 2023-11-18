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
    var age: String = ""
    var height: String = ""
    var weight: String = ""
    var actIntesity: String = ""
    
    func toModel() -> UserModel {
        return UserModel(
            name: self.name,
            gender: self.gender == genderListID[0]
                ? Gender.Male
                : Gender.Female,
            age: Int(self.age) ?? 0,
            height: Int(self.height) ?? 0,
            weight: Double(self.weight) ?? 0,
            activity: self.actIntesity == activityIntensityListID[0]
                ? ActivityIntensity.Sedentary
                : self.actIntesity == activityIntensityListID[1]
                    ? ActivityIntensity.Light
                    : self.actIntesity == activityIntensityListID[2]
                        ? ActivityIntensity.Moderate
                        : self.actIntesity == activityIntensityListID[3]
                            ? ActivityIntensity.Heavy
                            : ActivityIntensity.Athlete
        )
    }
    
    func isValid() -> Bool {
        return !name.isEmpty && !gender.isEmpty && !age.isEmpty && !height.isEmpty && !weight.isEmpty && !actIntesity.isEmpty
    }
}
