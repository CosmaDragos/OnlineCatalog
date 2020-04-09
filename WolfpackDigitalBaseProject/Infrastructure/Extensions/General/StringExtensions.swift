//
//  StringExtensions.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

extension String {
    /**
        True if the string is an email and false otherwise.
    */
    var isEmail: Bool {
        return self.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}",
                          options: .regularExpression) == self.startIndex..<self.endIndex
    }
    /**
        True if the string is a valid url
    */
    var isValidURL: Bool {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector?.firstMatch(in: self, options: [],
                                           range: NSRange(location: 0, length: self.utf16.count)) {
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
    /**
        Returns a string with no extra spaces. Removes consecutive spaces/tabs/new lines
        - Parameter canEndWithNewLine: true if you want to keep the new line if the string ends with it
    */
    func removeExtraSpaces(canEndWithNewLine: Bool = false) -> String {
        return Substring(self).removeExtraSpaces(canEndWithNewLine: canEndWithNewLine)
    }
}

extension Substring {
    /**
        Returns a string with no extra spaces. Removes consecutive spaces/tabs/new lines.
        - Parameter canEndWithNewLine: true if you want to keep the new line if the string ends with it
    */
    func removeExtraSpaces(canEndWithNewLine: Bool = false) -> String {
        let adjustedString = self.replacingOccurrences(of: "[\\s\n\t\r]+", with: " ",
                                                       options: .regularExpression, range: nil)
        if self.last == "\n" && canEndWithNewLine {
            return adjustedString + "\n"
        } else {
            return adjustedString
        }
    }
}
