//
//  DayLogModel.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 26/11/23.
//

import Foundation
import RealmSwift

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

class DayLogModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var date: Date
    @Persisted var weight: Double
    @Persisted var activityIntensity: ActivityIntensity
    @Persisted var targetProtein: Double
    @Persisted var targetCalorie: Double
    @Persisted var maintenanceCalorie: Double
    @Persisted var dietTarget: DietTarget
    @Persisted var foodLogs: List<FoodLogModel>
//    {
//        didSet {
//            switch (dietTarget) {
//                case .Decrease:
//                    self.targetCalorie = maintenanceCalorie - (15.0/100.0 * maintenanceCalorie)
//                case .Increase:
//                    self.targetCalorie = maintenanceCalorie + (15.0/100.0 * maintenanceCalorie)
//                default:
//                    self.targetCalorie = maintenanceCalorie
//            }
//        }
//    }
    
    convenience init(
        date: Date = Date().withoutTime(),
        weight: Double = 0,
        activityIntensity: ActivityIntensity = ActivityIntensity.Light,
        targetProtein: Double = 0,
        targetCalorie: Double = 0,
        maintenanceCalorie: Double = 0,
        dietTarget: DietTarget = DietTarget.Decrease
    ) {
        self.init()
        self.date = date
        self.weight = weight
        self.activityIntensity = activityIntensity
        self.targetProtein = targetProtein
        self.targetCalorie = targetCalorie
        self.maintenanceCalorie = maintenanceCalorie
        self.dietTarget = dietTarget
        self.foodLogs = List<FoodLogModel>()
    }

//    func countMaintenanceCalorie() -> Double {
//        // Follows Mifflin St. Jeor Formula
//        var BMR: Double
//        if (self.gender == Gender.Male) {
//            BMR = 9.99 * self.weight + 6.25 * Double(self.height) - 4.92 * Double(self.age) + 5
//        } else {
//            BMR = 9.99 * self.weight + 6.25 * Double(self.height) - 4.92 * Double(self.age) - 161
//        }
//
//        var TDEE: Double
//        switch (self.activity) {
//            case .Sedentary:
//                TDEE = BMR * 1.2
//            case .Light:
//                TDEE = BMR * 1.375
//            case .Moderate:
//                TDEE = BMR * 1.55
//            case .Heavy:
//                TDEE = BMR * 1.725
//            default:
//                TDEE = BMR * 1.9
//        }
//
//        return TDEE
//    }
    
    func toState() -> DayLogState {
        return DayLogState(
            weight: String(self.weight),
            actIntesity: activityIntensityListID[self.activityIntensity.rawValue]
        )
    }
}
