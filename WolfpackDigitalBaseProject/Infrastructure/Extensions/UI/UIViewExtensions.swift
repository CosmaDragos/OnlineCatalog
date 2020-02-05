//
//  UIViewExtensions.swift
//  Snapbuy
//
//  Created by Dan Ilies on 21/09/2019.
//  Copyright © 2019 Snapbuy. All rights reserved.
//

import UIKit

/*
 * MARK: - Rounded Corners
 */
extension UIView {
    
    // Corner Radius
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

/*
 * MARK: - Border
 */
extension UIView {
    // Border Width
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    // Border Color
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

/*
 * MARK: - Constraints
 */

struct BoundsLayout {
    let top: NSLayoutConstraint
    let leading: NSLayoutConstraint
    let bottom: NSLayoutConstraint
    let trailing: NSLayoutConstraint
}

extension UIView {
    
    func addSubviewAligned(_ subview: UIView, padding: UIEdgeInsets = .zero) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        self.boundaryLayout(subview, insets: padding)
    }
    
    @discardableResult
    func boundaryConstraints(_ subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) -> [NSLayoutConstraint] {
        let layout: BoundsLayout = boundaryConstraints(subview, insets: insets)
        return [layout.top, layout.leading, layout.bottom, layout.trailing]
    }
    
    @discardableResult
    func boundaryConstraints(_ subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) -> BoundsLayout {
        assert(subview.translatesAutoresizingMaskIntoConstraints == false,
               "Subview requires to have translatesAutoresizingMaskIntoConstraints to false.")
        
        let topConstraint = subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top)
        let leadingConstraint = subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left)
        let bottomConstraint = bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: insets.bottom)
        let trailingConstaint = trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: insets.right)
        
        return BoundsLayout(top: topConstraint, leading: leadingConstraint, bottom: bottomConstraint,
                            trailing: trailingConstaint)
    }
    
    func boundaryLayout(_ subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        NSLayoutConstraint.activate(boundaryConstraints(subview, insets: insets))
    }
    
    func shake(delegate: CAAnimationDelegate) {
        let animationKeyPath = "transform.translation.x"
        let shakeAnimation = "shake"
        let duration = 0.6
        let animation = CAKeyframeAnimation(keyPath: animationKeyPath)
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = duration
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0]
        animation.delegate = delegate
        layer.add(animation, forKey: shakeAnimation)
    }
    
}

/*
 * MARK: - Load from Nib
 */

extension UIView {

    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}


/*
 * MARK: - UIView to Image
 */

extension UIView {
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
}
