//
//  UserModel.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation
import RealmSwift

enum Gender: Int, PersistableEnum {
    case Male
    case Female
}

enum ActivityIntensity: Int, PersistableEnum {
    case Sedentary  // Office jobs
    case Light      // 1-2 days/week
    case Moderate   // 3-5 days/week
    case Heavy      // 6-7 days/week
    case Athlete    // 2x per day
}

enum DietTarget: Int, PersistableEnum {
    case Decrease
    case Maintain
    case Increase
}

class UserModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var gender: Gender
    @Persisted var age: Int
    @Persisted var height: Int
    @Persisted var weight: Double
    @Persisted var activity: ActivityIntensity
    @Persisted var targetCalorie: Double
    @Persisted var targetProtein: Double
    @Persisted var maintenanceCalorie: Double
    @Persisted var dietTarget: DietTarget? {
        didSet {
            switch (dietTarget) {
                case .Decrease:
                    self.targetCalorie = maintenanceCalorie - (15.0/100.0 * maintenanceCalorie)
                case .Increase:
                    self.targetCalorie = maintenanceCalorie + (15.0/100.0 * maintenanceCalorie)
                default:
                    self.targetCalorie = maintenanceCalorie
            }
        }
    }
    
    convenience init(name: String, gender: Gender, age: Int, height: Int, weight: Double, activity: ActivityIntensity) {
        self.init()
        self.name = name
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
        self.activity = activity
        self.targetCalorie = -1
        self.targetProtein = 2.2 * weight
        self.dietTarget = nil
        self.maintenanceCalorie = countMaintenanceCalorie()
    }
    
    static func createDummy() -> UserModel {
        return UserModel(name: "", gender: Gender.Male, age: 0, height: 0, weight: 0, activity: ActivityIntensity.Athlete)
    }
    
    func countMaintenanceCalorie() -> Double {
        // Follows Mifflin St. Jeor Formula
        var BMR: Double
        if (self.gender == Gender.Male) {
            BMR = 9.99 * self.weight + 6.25 * Double(self.height) - 4.92 * Double(self.age) + 5
        } else {
            BMR = 9.99 * self.weight + 6.25 * Double(self.height) - 4.92 * Double(self.age) - 161
        }
        
        var TDEE: Double
        switch (self.activity) {
            case .Sedentary:
                TDEE = BMR * 1.2
            case .Light:
                TDEE = BMR * 1.375
            case .Moderate:
                TDEE = BMR * 1.55
            case .Heavy:
                TDEE = BMR * 1.725
            default:
                TDEE = BMR * 1.9
        }
        
        return TDEE
    }
    
    func toState() -> UserState {
        return UserState(
            name: self.name,
            gender: genderListID[self.gender.rawValue],
            age: String(self.age),
            height: String(self.height),
            weight: String(self.weight),
            actIntesity: activityIntensityListID[self.activity.rawValue])
    }
}
