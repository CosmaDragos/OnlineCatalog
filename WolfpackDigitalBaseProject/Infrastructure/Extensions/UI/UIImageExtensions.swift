//
//  UIImageExtensions.swift
//  Snapbuy
//
//  Created by Dan Ilies on 27/09/2019.
//  Copyright © 2019 Snapbuy. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
    
}
