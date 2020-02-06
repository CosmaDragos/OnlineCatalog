//
//  DateExtensions.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

extension DateFormatter {
    func shortDateWithTimeFormattedString(from date: Date) -> String {
        self.dateFormat = "dd/MM/yy HH:mm"
        return self.string(from: date)
    }
}

extension Date {
    
    func toTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM \nHH:mm"
        return formatter.string(from: self)
    }
    
    func monthDayLongStyleDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter.string(from: self)
    }
    
    func yearMonthDayLongStyleDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM d"
        return formatter.string(from: self)
    }
    
}
