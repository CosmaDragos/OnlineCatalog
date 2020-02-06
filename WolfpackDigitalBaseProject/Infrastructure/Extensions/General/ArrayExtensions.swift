//
//  ArrayExtensions.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

extension Array {
    /**
        Safely retreive the element at specified specified index. Returns the element if the index exists and nil otherwise.
     
        - Parameter index: The index you want to access
    */
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
