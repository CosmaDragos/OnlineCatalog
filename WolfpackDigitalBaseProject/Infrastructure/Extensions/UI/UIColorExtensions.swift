//
//  UIColorExtensions.swift
//  
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import UIKit

/*
 * MARK: - Transformations
 */
extension UIColor {
    
    func toImage(width: CGFloat, height: CGFloat) -> UIImage {
        let size = CGSize(width: width, height: height)
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
    
}

