//
//  BookStoreColor.swift
//  BookStore
//
//  Created by Abhishek Singh on 28/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

class BookStoreColor {
    static let greySeparator = UIColor(rgb: 0xD8D8D8)
    static let gradientStartColor = UIColor(rgb: 0xFF3381)
    static let gradientEndColor = UIColor(rgb: 0xFF414E)
    static let lightGreyColor =  UIColor(rgb: 0x4A4A4A)
    static let VerylightGreyBGColor =  UIColor(red: 247, green: 249, blue: 250)
    static let lowWhiteColor =  UIColor(rgb: 0xFAF6F6)

}

extension UIColor {
   
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

