//
//  UIViewController+LoadingView.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func embedLoadingView() -> LoadingViewController {
        let loadingView = LoadingViewController()
        embed(asChildViewController: loadingView)
        loadingView.loaderView.startAnimating()
        return loadingView
    }
    
    func removeLoadingView(loadingView: LoadingViewController) {
        loadingView.loaderView.stopAnimating()
        remove(childViewController: loadingView)
    }
    
}
