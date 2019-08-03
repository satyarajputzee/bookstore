//
//  LoadingViewController.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    
    convenience init() {
        self.init(nibName: String(describing: LoadingViewController.self), bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loaderView.setupAppearance()
    }
}
