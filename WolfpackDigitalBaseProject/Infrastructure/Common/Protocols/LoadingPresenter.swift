//
//  LoadingPresenter.swift
//  
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

private let minDuration: TimeInterval = 1
/**
 * Handle the display of custom activity indicators
 */
protocol LoadingPresenter where Self: UIViewController {
    var loadingView: LoadingView? { get set }
    //var timer: Timer { get set }

    func showLoading()
    func hideLoading()
}

extension LoadingPresenter {

    func showLoading() {
        let loadingView = self.loadingView ?? LoadingView(frame: self.view.frame)
        self.loadingView = loadingView
        if loadingView.superview == nil {
            if self is UITableViewController, let navigationController = self.navigationController {
                navigationController.view.insertSubview(loadingView, belowSubview: navigationController.navigationBar)
            } else {
                self.view.addSubviewAligned(loadingView)
                self.view.bringSubviewToFront(loadingView)
            }
        }

        //self.timer.fire()
        loadingView.play()
    }

    func hideLoading() {
        guard let loadingView = self.loadingView else { return }
        loadingView.stop()
        loadingView.removeFromSuperview()
        /*
        let elapsedTime = timer.timeInterval
        if elapsedTime < minDuration {
            DispatchQueue.main.asyncAfter(deadline: .now() + minDuration - elapsedTime) {
                loadingView.stop()
                loadingView.removeFromSuperview()
                self.timer = Timer()
                return
            }
        } else {
            loadingView.stop()
            loadingView.removeFromSuperview()
            self.timer.invalidate()
            self.timer = Timer()
        }
        */
    }
}
