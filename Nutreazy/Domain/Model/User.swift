//
//  User.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 11/10/23.
//

import Foundation

enum Gender {
    case Male
    case Female
}

enum ActivityIntensity {
    case Sedentary  // Office jobs
    case Light      // 1-2 days/week
    case Moderate   // 3-5 days/week
    case Heavy      // 6-7 days/week
    case Athlete    // 2x per day
}

enum DietTarget {
    case Decrease
    case Maintain
    case Increase
}

class User {
    var name: String
    var gender: Gender
    var age: Int
    var height: Int
    var weight: Int
    var activity: ActivityIntensity
    var targetCalorie: Int
    var dietTarget: DietTarget
    var maintenanceCalorie: Int
    
    init(name: String, gender: Gender, age: Int, height: Int, weight: Int, activity: ActivityIntensity, targetCalorie: Int, dietTarget: DietTarget, maintenanceCalorie: Int) {
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
