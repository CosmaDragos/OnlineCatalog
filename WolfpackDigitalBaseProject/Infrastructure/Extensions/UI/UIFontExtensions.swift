//
//  UIFontExtensions.swift
//  Snapbuy
//
//  Created by Dan Ilies on 30/09/2019.
//  Copyright © 2019 Snapbuy. All rights reserved.
//

import UIKit

// MARK: - Custom Fonts

extension UIFont {
    
    static func appFontRegular(ofSize size: CGFloat) -> UIFont {
        return create(withName: "HelveticaNeue", andSize: size)
    }
    
    static func appFontBold(ofSize size: CGFloat) -> UIFont {
        return create(withName: "HelveticaNeue-Bold", andSize: size)
    }
    
    static func appFontLight(ofSize size: CGFloat) -> UIFont {
        return create(withName: "HelveticaNeue-Light", andSize: size)
    }
    
    private static func create(withName name: String, andSize size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
