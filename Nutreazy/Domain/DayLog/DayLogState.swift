//
//  DayLogState.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 29/11/23.
//

import Foundation

struct DayLogState : Equatable {
    var weight: String = ""
    var actIntesity: String = ""
    
    func toModel() -> DayLogModel {
        return DayLogModel(
            weight: Double(self.weight) ?? 0,
            activityIntensity: self.actIntesity == activityIntensityListID[0]
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
        return !weight.isEmpty && !actIntesity.isEmpty
    }
}
