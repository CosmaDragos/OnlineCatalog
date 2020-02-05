//
//  UIColorExtensions.swift
//  Snapbuy
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2019 Snapbuy. All rights reserved.
//

import UIKit

/*
 * MARK: - Custom Colors
 */
extension UIColor {
    
    static let appBlue = UIColor(named: "appBlue") ?? UIColor.blue
    
}


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

