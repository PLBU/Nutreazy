//
//  Extension.swift
//  Nutreazy
//
//  Created by Renaldi Arlin on 25/11/23.
//

import Foundation

extension Date {
    func withoutTime() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        components.timeZone = NSTimeZone.system
        let date = Calendar.current.date(from: components)
        return date!
    }
    
    func getFormattedDate() -> String {
        let today = Date().withoutTime()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!.withoutTime()

        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "d MMM"

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "d MMM YY"

        if self == today {
            return "Hari ini"
        } else if self == yesterday {
            return "Kemarin"
        } else if Calendar.current.component(.year, from: self) == Calendar.current.component(.year, from: Date()) {
            return dateFormatter1.string(from: self)
        } else {
            return dateFormatter2.string(from: self)
        }
    }
    
    func getCurrentYear() -> Int {
        return Calendar.current.component(.year, from: Date())
    }
}
