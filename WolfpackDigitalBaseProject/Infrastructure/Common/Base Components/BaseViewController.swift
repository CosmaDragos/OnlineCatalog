//
//  BaseViewController.swift
//  
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit
import ReactiveKit

class BaseViewController: UIViewController, Observer, LoadingPresenter, AlertPresenter {

    // MARK: - Properties
    
    let disposeBag = DisposeBag()
    
    var loadingView: LoadingView?
    
}
