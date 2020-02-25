//
//  AttributedStringExtensions.swift
//  WolfpackDigitalBaseProject
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import Foundation

import UIKit

extension NSMutableAttributedString {
    /**
        Returns a NSMutableAttributedString with the specified text and size and bold system font attribute
    */
    @discardableResult
    func boldSystem(_ text: String, size: CGFloat) -> NSMutableAttributedString {
        let boldString = NSMutableAttributedString(string: text)
        boldString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: size),
            range: (text as NSString).range(of: text))
        append(boldString)
        return self
    }
    
    /**
        Returns a NSMutableAttributedString with the specified text and size and regular system font attribute
    */
    @discardableResult
    func normalSystem(_ text: String, size: CGFloat) -> NSMutableAttributedString {
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(.font, value: UIFont.systemFont(ofSize: size),
            range: (text as NSString).range(of: text))
        append(string)
        return self
    }

    /**
        Returns a NSMutableAttributedString with the specified text underlined
    */
    @discardableResult
    func underlineSystem(_ text: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttributes([.underlineStyle: NSUnderlineStyle.single.rawValue,
                                      .foregroundColor: color,
                                      .font: font], range: textRange)
        
        append(attributedText)
        return self
    }
    
    /**
        Adds an image to the end of the attributed string
    */
    @discardableResult
    func addImage(named imageName: String) -> NSAttributedString {
        let attachment = NSTextAttachment()
        guard let image = UIImage(named: imageName) else {
            return self
        }
        attachment.image = image
        
        var range = NSRange(location: 0, length: self.length)
        guard let font = self.attributes(at: 0, effectiveRange: &range)[.font] as? UIFont else {
            return self
        }
        
        attachment.bounds = CGRect(x: 0, y: (font.capHeight - image.size.height).rounded() / 2,
                                   width: image.size.width, height: image.size.height)

        self.append(NSAttributedString(attachment: attachment))
        return self
    }
    
    /**
        Initializes an attributed string with an image
    */
    convenience init(imageName: String, attributes: [NSAttributedString.Key: Any]) {
        self.init(string: "", attributes: attributes)
        
        let attachment = NSTextAttachment()
        guard let image = UIImage(named: imageName) else {
            return
        }
        attachment.image = image
        
        guard let font = attributes[NSAttributedString.Key.font] as? UIFont else {
            return
        }
        
        attachment.bounds = CGRect(x: 0, y: (font.capHeight - image.size.height).rounded() / 2,
                                   width: image.size.width, height: image.size.height)
        
        self.append(NSAttributedString(attachment: attachment))
    }
}

extension NSAttributedString {
    /**
        Returns the needed height for an attributed string using the container width
    */
    func height(containerWidth: CGFloat) -> CGFloat {
        let rect = self.boundingRect(
            with: CGSize.init(width: containerWidth,
                              height: CGFloat.greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return ceil(rect.size.height)
    }
}
