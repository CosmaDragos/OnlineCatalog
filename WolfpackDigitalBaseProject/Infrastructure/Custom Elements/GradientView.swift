//
//  GradientView.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable class GradientView: UIView {

    @IBInspectable var startPoint: CGPoint = .zero {
        didSet {
            self.drawGradient()
        }
    }

    @IBInspectable var endPoint: CGPoint = .zero {
        didSet {
            self.drawGradient()
        }
    }

    @IBInspectable var startColor: UIColor = .clear {
        didSet {
            self.drawGradient()
        }
    }

    @IBInspectable var endColor: UIColor = .clear {
        didSet {
            self.drawGradient()
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.drawGradient()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawGradient()
    }

    private func drawGradient() {
        guard let gradientLayer = self.layer as? CAGradientLayer else {
            return
        }
        gradientLayer.colors = [self.startColor.cgColor, self.endColor.cgColor]
        gradientLayer.startPoint = self.startPoint
        gradientLayer.endPoint = self.endPoint
    }
}
