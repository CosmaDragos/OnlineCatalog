//
//  Bindable.swift
//  WolfpackDigitalBaseProject
//
//  Created by Bianca Felecan on 02/12/2019.
//  Copyright © 2019 Wolfpack Digital. All rights reserved.
//

import Bond
import ReactiveKit


/// Use for classes that have a viewMode to easily observe properties. It handless disposal and all you have to do is override setupBindings and use the observe method.
class Bindable<ViewModel> {

    let disposeBag = DisposeBag()
    
    var viewModel: ViewModel? {
        didSet {
            self.clearBindings()
            self.setupBindings()
        }
    }
    
    deinit {
        self.disposeBag.dispose()
    }
    
    func observe<A>(_ obervable: Observable<A>,
                    _ execute: @escaping (A) -> Void) {
        let disposable = obervable.observeNext { [weak self] a in
            guard let _ = self else { return }
            execute(a)
        }
        disposable.dispose(in: disposeBag)
    }
    
    func setupBindings() {
        assert(false, "Override in subclass")
    }
    
    func clearBindings() -> Void {
        self.disposeBag.dispose()
    }
}
