//
//  User.swift
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

class User: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var gender: Gender
    @Persisted var age: Int
    @Persisted var height: Int
    @Persisted var weight: Int
    @Persisted var activity: ActivityIntensity
    @Persisted var targetCalorie: Int
    @Persisted var dietTarget: DietTarget
    @Persisted var maintenanceCalorie: Int
    
    convenience init(name: String, gender: Gender, age: Int, height: Int, weight: Int, activity: ActivityIntensity, targetCalorie: Int, dietTarget: DietTarget, maintenanceCalorie: Int) {
        self.init()
        self.name = name
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
        self.activity = activity
        self.targetCalorie = targetCalorie
        self.dietTarget = dietTarget
        self.maintenanceCalorie = maintenanceCalorie
    }
}
