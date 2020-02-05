//
//  UIViewControllerExtensions.swift
//  Snapbuy
//
//  Created by Dan Ilies on 30/09/2019.
//  Copyright © 2019 Snapbuy. All rights reserved.
//

import UIKit

// MARK: - Keyboard Hiding

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
