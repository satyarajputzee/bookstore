//
//  GradientView.swift
//  BookStore
//
//  Created by Abhishek Singh on 29/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

@IBDesignable final class GradientView: UIView {
    
    @IBInspectable
    var startColor: UIColor = BookStoreColor.gradientStartColor
    
    @IBInspectable
    var endColor: UIColor = BookStoreColor.gradientEndColor
    
    private let gradientLayerName = "Gradient"
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }
    
    private func setupGradient() {
        var gradient: CAGradientLayer? = layer.sublayers?.first { $0.name == gradientLayerName } as? CAGradientLayer
        if gradient == nil {
            gradient = CAGradientLayer()
            gradient?.name = gradientLayerName
            layer.addSublayer(gradient!)
        }
        gradient?.frame = bounds
        gradient?.colors = [startColor.cgColor, endColor.cgColor]
        gradient?.zPosition = -1
    }
    
}
