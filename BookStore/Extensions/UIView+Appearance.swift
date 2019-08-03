//
//  UIView+Appearance.swift
//  BookStore
//
//  Created by Abhishek Singh on 27/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    public func applyShadow(color: UIColor, radius: CGFloat, opacity: Float, offset: CGSize) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.masksToBounds = false
    }
    
    public func removeShadow() {
        layer.shadowOpacity = 0
    }
    
    public func applyTelusShadow() {
        applyShadow(color: UIColor.black, radius: 4, opacity: 0.4, offset: CGSize(width: 0, height: 2))
    }
}
