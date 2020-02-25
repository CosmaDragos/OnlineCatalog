//
//  SettingsOpener.swift
//  
//
//  Created by Dan Ilies on 24/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

/**
 * Opens the App Settings
 */
protocol SettingsOpener {
    func openAppSettings()
}

extension SettingsOpener {
    
    func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(settingsURL) else {
                return
        }
        UIApplication.shared.open(settingsURL)
    }
    
}
