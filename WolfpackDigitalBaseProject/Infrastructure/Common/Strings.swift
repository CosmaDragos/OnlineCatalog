//
//  Strings.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 05/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

struct Strings {
    
    struct General {
        static var back: String {
            return NSLocalizedString("Back", comment: "Back")
        }
        static var yes: String {
            return NSLocalizedString("Yes", comment: "yes")
        }

        static var no: String {
            return NSLocalizedString("No", comment: "no")
        }

        static var cancel: String {
            return NSLocalizedString("Cancel", comment: "cancel")
        }
    }
    
    struct Alerts {
        static var permissionsTitle: String {
            return NSLocalizedString("Permissions required", comment: "Alert Permissions Title")
        }
        static var permissionsMessage: String {
            return NSLocalizedString("Please turn on the required permissions from Settings in order to continue", comment: "Alert Permissions Message")
        }
        static var settingsButtonTitle: String {
            return NSLocalizedString("Go to Settings", comment: "Settings redirect button")
        }
    }
    
}
