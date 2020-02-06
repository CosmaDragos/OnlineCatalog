//
//  Observer.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Bond
import ReactiveKit

protocol Observer: class {
    
    var disposeBag: DisposeBag { get }
    
    func observe<A>(_ obervable: Observable<A>,
    _ execute: @escaping (A) -> Void)
}

extension Observer {
    
    func observe<A>(_ obervable: Observable<A>,
                    _ execute: @escaping (A) -> Void) {
        obervable.observeNext { [weak self] a in
            guard let _ = self else { return }
            execute(a)
        }.dispose(in: disposeBag)
    }
    
    func clearBindings() -> Void {
        self.disposeBag.dispose()
    }
    
}
