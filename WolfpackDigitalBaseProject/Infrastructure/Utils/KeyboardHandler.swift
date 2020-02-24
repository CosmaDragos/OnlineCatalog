//
//  File.swift
//  
//
//  Created by Bianca Felecan on 06/12/2019.
//

import Foundation
import UIKit

/**
 * Handle keyboard "show" and "hide" actions
 */

public protocol KeyboardHandler: class {
    func registerForKeyboardEvents()
    func unregisterForKeyboardEvents()
    func keyboardWillShow(height: CGFloat)
    func keyboardWillChangeFrame(height: CGFloat)
    func keyboardWillHide()
}

public extension KeyboardHandler {
    
    func registerForKeyboardEvents() {
        let defaultCenter = NotificationCenter.default
        
        var tokenShow: NSObjectProtocol!
        tokenShow = defaultCenter.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil, queue: nil) { [weak self] (notification) in
            guard let self = self else {
                defaultCenter.removeObserver(tokenShow as Any)
                return
            }
            self.keyboardWillShow(notification: notification as NSNotification)
        }
        var tokenHide: NSObjectProtocol!
        tokenHide = defaultCenter.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil, queue: nil) { [weak self] (notification) in
            guard let self = self else {
                defaultCenter.removeObserver(tokenHide as Any)
                return
            }
            self.keyboardWillHide(notification: notification as NSNotification)
        }
        var tokenWillChangeFrame: NSObjectProtocol!
        tokenWillChangeFrame = defaultCenter.addObserver(
            forName: UIResponder.keyboardWillChangeFrameNotification,
            object: nil, queue: nil) { [weak self] (notification) in
                guard let self = self else {
                    defaultCenter.removeObserver(tokenWillChangeFrame as Any)
                    return
                }
                self.keyboardWillChangeFrame(notification: notification as NSNotification)
        }
    }
    
    func unregisterForKeyboardEvents() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillChangeFrameNotification,
                                                  object: nil)
    }
    
    private func keyboardWillShow(notification: NSNotification) {
        if let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
            .cgRectValue.height {
            self.keyboardWillShow(height: height)
        }
    }
    
    private func keyboardWillHide(notification: NSNotification) {
        self.keyboardWillHide()
    }
    
    private func keyboardWillChangeFrame(notification: NSNotification) {
        if let height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
            .cgRectValue.height {
            self.keyboardWillChangeFrame(height: height)
        }
    }
}

