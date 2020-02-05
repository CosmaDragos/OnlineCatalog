//
//  File.swift
//  
//
//  Created by Bianca Felecan on 06/12/2019.
//

import UIKit

/**
 * Handle keyboard "show" and "hide" actions
 * Automatically scroll the view as necessary
 */

public protocol KeyboardScrollHandler: KeyboardHandler where Self: UIViewController {
    var scrollView: UIScrollView! { get }
}

public extension KeyboardScrollHandler {
    
    func keyboardWillShow(height: CGFloat) {
        self.updateScrollView(height: height)
    }
    
    func keyboardWillHide() {
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func keyboardWillChangeFrame(height: CGFloat) {
        self.updateScrollView(height: height)
    }
    
    private func updateScrollView(height: CGFloat) {
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: height, right: 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
    }
}

