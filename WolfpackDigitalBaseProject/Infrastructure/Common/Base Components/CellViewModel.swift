//
//  CellViewModel.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 05/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Bond

protocol CellViewModel {
    associatedtype Action
    
    var cellIdentifier: String { get }
    var action: Observable<Action?> { get }
}
