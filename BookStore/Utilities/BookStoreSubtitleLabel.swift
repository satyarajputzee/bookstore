//
//  BookStoreSubtitleLabel.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

class BookStoreSubtitleLabel: UILabel {
    
    override func didMoveToWindow() {
        self.font = UIFont(name: "HelveticaNeue", size: 14)
        self.textColor = BookStoreColor.lightGreyColor
        self.minimumScaleFactor = 0.5
    }
}
