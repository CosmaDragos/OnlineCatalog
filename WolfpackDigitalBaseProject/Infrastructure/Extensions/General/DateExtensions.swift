//
//  DateExtensions.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

extension DateFormatter {
    /**
        # Formatted date using the dd/MM/yy HH:mm format.
        *Example: 02/12/19 14:22 *
    */
    func shortDateWithTimeFormattedString(from date: Date) -> String {
        self.dateFormat = "dd/MM/yy HH:mm"
        return self.string(from: date)
    }
}

extension Date {
    /**
        Returns true if date is in current year and false otherwise
    */
    var isInCurrentYear: Bool {
        guard let year = Calendar.current.dateComponents([.year], from: self).year,
            let currentYear = Calendar.current.dateComponents([.year], from: Date()).year else {
                return false
        }
        return year == currentYear
    }
    
    /**
        # Formatted time using the HH:mm format.
        *Example: 14:22 *
    */
    func toTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    /**
        # Formatted date using the MMMM d format.
        *Example: December 2*
    */
    func monthDayLongStyleDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter.string(from: self)
    }
    
    /**
        # Formatted date using the yyyy MMMM d format.
        *Example: 2019 December 2*
    */
    func yearMonthDayLongStyleDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MMMM d"
        return formatter.string(from: self)
    }
}

