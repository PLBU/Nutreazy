//
//  Extension.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import Foundation

extension Date {
    func withoutTime() -> Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let date = Calendar.current.date(from: components)
        return date!
    }
}
