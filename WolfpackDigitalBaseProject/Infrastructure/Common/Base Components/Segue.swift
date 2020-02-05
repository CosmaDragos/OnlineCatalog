//
//  Segue.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 05/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

// MARK: - Segue Wrapper

protocol Segue {
    var rawValue: String { get }
}

extension UIViewController {
    
    func performSegue(_ segue: Segue, sender: Any? = nil) {
        self.performSegue(withIdentifier: segue.rawValue, sender: sender)
    }
    
}
