//
//  ViewModel.swift
//  
//
//  Created by Dan Ilies on 02/10/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Bond

protocol ViewModel {
    associatedtype Command
    
    var command: Observable<Command?> { get }
    var errorMessage: Observable<String?> { get }
}
