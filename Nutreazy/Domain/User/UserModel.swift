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

class UserModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String
    @Persisted var gender: Gender
    @Persisted var yearBorn: Int
    @Persisted var height: Int
    var age: Int {
        get { Calendar.current.component(.year, from: Date()) - yearBorn }
    }
    
    convenience init(name: String, gender: Gender, yearBorn: Int, height: Int) {
        self.init()
        self.name = name
        self.gender = gender
        self.yearBorn = yearBorn
        self.height = height
    }
    
    static func createDummy() -> UserModel {
        return UserModel(name: "", gender: Gender.Male, yearBorn: 0, height: 0)
    }
    
//    func toState() -> UserState {
//        return UserState(
//            name: self.name,
//            gender: genderListID[self.gender.rawValue],
//            yearBorn: String(self.yearBorn),
//            height: String(self.height),
//            weight: String(self.weight),
//            actIntesity: activityIntensityListID[self.activity.rawValue])
//    }
}
