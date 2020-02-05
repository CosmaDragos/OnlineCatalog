//
//  LoadingView.swift
//  Ideacracy
//
//  Created by Bianca Felecan on 05/09/2019.
//  Copyright © 2019 Wolfpack Digital. All rights reserved.
//

/*
import UIKit
import Lottie

@IBDesignable public class LoadingView: UIView {
    
    public let animationView = AnimationView()
    
    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    
    @IBInspectable public var width: CGFloat = 100 {
        didSet {
            self.widthConstraint.constant = width
            self.animationView.layoutIfNeeded()
        }
    }
    
    @IBInspectable public var height: CGFloat = 100 {
        didSet {
            self.heightConstraint.constant = width
            self.animationView.layoutIfNeeded()
        }
    }
    
    @IBInspectable public var animationFileName: String = "loading-animation" {
        didSet {
            self.animationView.animation = Animation.named(animationFileName)
        }
    }
    
    @IBInspectable public var useLightBackground: Bool = false {
        didSet {
            if useLightBackground {
                self.backgroundColor = UIColor.white.withAlphaComponent(0.7)
            } else {
                if #available(iOS 13.0, *) {
                    self.backgroundColor = UIColor.systemFill
                } else {
                    self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
                }
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthConstraint = animationView.widthAnchor.constraint(equalToConstant: self.width)
        self.heightConstraint = animationView.heightAnchor.constraint(equalToConstant: self.height)
        
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.widthConstraint,
            self.heightConstraint
        ])
        
        animationView.layoutIfNeeded()
        
        self.animationView.animation = Animation.named(animationFileName)
    }
    
    public func play() {
        self.animationView.loopMode = .loop
        self.animationView.play()
    }
    
    public func stop() {
        self.animationView.stop()
    }
    
}
*/
