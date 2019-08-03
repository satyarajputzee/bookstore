//
//  Promise+LoadingView.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import PromiseKit
import UIKit

extension Promise {
    
    func addLoadingIndicator(viewController: UIViewController) -> Promise<T> {
        viewController.navigationController?.isNavigationBarHidden = true
        
        let loadingView = viewController.embedLoadingView()
        return self.ensure {
            viewController.removeLoadingView(loadingView: loadingView)
            viewController.navigationController?.isNavigationBarHidden = false
        }
    }
}
