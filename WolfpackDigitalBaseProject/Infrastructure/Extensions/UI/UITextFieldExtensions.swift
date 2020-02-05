//
//  UITextFieldExtensions.swift
//  
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

// MARK: - Toolbar

extension UITextField {
    
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}

// MARK: - Placeholder

extension UITextField {
    
    func setPlaceholderColor(_ color: UIColor) {
        guard let placeholderText = self.placeholder else { return }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
}

// MARK: - Helpers

private let defaultIconSize = CGSize(width: 16, height: 16)
private let defaultIconPadding = UIEdgeInsets(top: 5, left: 16, bottom: 5, right: 16)
private let defaultRightIconPadding = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)

extension UITextField {
    
    func setLeftIcon(_ image: UIImage?, size: CGSize = defaultIconSize,
                     padding: UIEdgeInsets = defaultIconPadding) {
        guard image != nil else { return }
        let containerViewSize = CGSize(width: padding.left + size.width + padding.right,
                                       height: padding.top + size.height + padding.bottom)
        let iconView = UIImageView(frame: CGRect(x: padding.left, y: padding.top, width: size.width, height: size.height))
        iconView.contentMode = .scaleAspectFit
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(origin: .zero, size: containerViewSize))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setLeftIcon(_ imageName: String, size: CGSize = defaultIconSize,
                     padding: UIEdgeInsets = defaultIconPadding) {
        self.setLeftIcon(UIImage(named: imageName))
    }
    
    func setRightIcon(_ image: UIImage, size: CGSize = defaultIconSize,
                      padding: UIEdgeInsets = defaultRightIconPadding) {
        let containerViewSize = CGSize(width: padding.left + size.width + padding.right,
                                       height: padding.top + size.height + padding.bottom)
        let iconView = UIImageView(frame: CGRect(x: padding.left, y: padding.top, width: size.width, height: size.height))
        iconView.contentMode = .scaleAspectFit
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(origin: .zero, size: containerViewSize))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
    
    func setRightButton(buttonAction: Selector) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "search"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(nil, action: buttonAction, for: .touchUpInside)
        rightView = button
        rightViewMode = .whileEditing
        return button
    }
    
    @IBInspectable var contentLeftPadding: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
}
