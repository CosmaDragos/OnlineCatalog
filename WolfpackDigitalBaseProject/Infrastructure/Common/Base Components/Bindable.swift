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

protocol Bindable: class {
    
    associatedtype ViewModel
    
    var disposeBag: DisposeBag { get }
    var viewModel: ViewModel? { get set }
    
    func observe<A>(_ obervable: Observable<A>,
                    _ execute: @escaping (A) -> Void)
    
    func setupBindings()
}

extension Bindable {
    
    func observe<A>(_ obervable: Observable<A>,
                    _ execute: @escaping (A) -> Void) {
        let disposable = obervable.observeNext { [weak self] a in
            guard let _ = self else { return }
            execute(a)
        }
        disposable.dispose(in: disposeBag)
    }
    
    func clearBindings() -> Void {
        self.disposeBag.dispose()
    }
}
