//
//  UINavigationBarExtensions.swift
//  
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func makeTransparent() {
        self.isTranslucent = true
        self.setBackgroundImage(UIImage(), for: .default)
        self.backgroundColor = .clear
        self.shadowImage = UIImage()
    }
    
    func makeOpaque(color: UIColor = .white) {
        self.isTranslucent = false
        self.backgroundColor = color
        self.setBackgroundImage(UIImage.imageWithColor(color: color), for: .default)
        self.shadowImage = UIColor.appBlue.toImage(width: UIScreen.main.bounds.width, height: 0.5)
    }

}
