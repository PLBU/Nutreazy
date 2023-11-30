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
    
    convenience init(
        date: Date = Date().withoutTime(),
        weight: Double? = nil,
        activityIntensity: ActivityIntensity? = nil,
        targetProtein: Double? = nil,
        targetCalorie: Double? = nil,
        maintenanceCalorie: Double? = nil,
        dietTarget: DietTarget? = nil
    ) {
        self.init()
        
        let lastDayLog = DayLogManager.instance.getLastDayLog()
        
        self.date = date
        self.weight = weight ?? lastDayLog?.weight ?? 0
        self.activityIntensity = activityIntensity ?? lastDayLog?.activityIntensity ?? ActivityIntensity.Light
        self.targetProtein = targetProtein ?? lastDayLog?.targetProtein ?? 0
        self.targetCalorie = targetCalorie ?? lastDayLog?.targetCalorie ?? 0
        self.maintenanceCalorie = maintenanceCalorie ?? lastDayLog?.maintenanceCalorie ?? 0
        self.dietTarget = dietTarget ?? lastDayLog?.dietTarget ?? DietTarget.Decrease
        self.foodLogs = List<FoodLogModel>()
    }
    
    func setTargetProtein() {
        self.targetProtein = self.weight * 2.2
    }
    
    func setTargetCalorie() {
        switch (dietTarget) {
            case .Decrease:
                self.targetCalorie = maintenanceCalorie - (15.0/100.0 * maintenanceCalorie)
            case .Increase:
                self.targetCalorie = maintenanceCalorie + (15.0/100.0 * maintenanceCalorie)
            default:
                self.targetCalorie = maintenanceCalorie
        }
    }

    func setMaintenanceCalorie() {
        if let myUser = MyUserManager.instance.getMyUser() {
            // Follows Mifflin St. Jeor Formula
            var BMR: Double
            
            if (myUser.gender == Gender.Male) {
                BMR = 9.99 * self.weight + 6.25 * Double(myUser.height) - 4.92 * Double(myUser.age) + 5
            } else {
                BMR = 9.99 * self.weight + 6.25 * Double(myUser.height) - 4.92 * Double(myUser.age) - 161
            }
            
            var TDEE: Double
            switch (self.activityIntensity) {
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
            
            self.maintenanceCalorie = TDEE
        }
    }
    
    func toState() -> DayLogState {
        return DayLogState(
            weight: String(self.weight),
            actIntesity: activityIntensityListID[self.activityIntensity.rawValue]
        )
    }
}
