//
//  Bindable.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 02/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Bond
import ReactiveKit

/// Use for classes that have a viewModel to easily observe properties. It handless disposal and all you have to do is override setupBindings and use the observe method.

protocol Bindable: Observer {
    
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
    
    func setupBindings()
}
