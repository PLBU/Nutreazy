//
//  RegisterModel.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 20/11/23.
//

import Foundation
import RealmSwift

class RegisterModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
}
