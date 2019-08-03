//
//  BookStoreNavigationViewController.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit

class BookStoreNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: BookStoreColor.lowWhiteColor,
            NSAttributedString.Key.font: BookStoreFont.navTitle]
        navigationBar.applyNavigationGradient()
    }

}
