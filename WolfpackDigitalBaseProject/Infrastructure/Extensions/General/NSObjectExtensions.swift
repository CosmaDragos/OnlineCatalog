//
//  NSObjectExtensions.swift
//  
//
//  Created by Dan Ilies on 05/10/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var name: String {
        return String(describing: type(of: self))
    }
    
}
