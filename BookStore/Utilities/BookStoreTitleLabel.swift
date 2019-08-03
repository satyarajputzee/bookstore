//
//  BookStoreTitleLabel.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

class BookStoreTitleLabel: UILabel {
    
    override func didMoveToWindow() {
        self.font = UIFont(name: "HelveticaNeue", size: 18)
        self.textColor = BookStoreColor.gradientStartColor
        self.minimumScaleFactor = 0.5
    }
}
