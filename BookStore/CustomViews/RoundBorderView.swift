//
//  RoundBorderView.swift
//  BookStore
//
//  Created by Abhishek Singh on 27/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

class RoundBorderView: UIView {
    
    private var radius: CGFloat = 4.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let parent = self.superview else { return }
        parent.applyTelusShadow()
       
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
}

