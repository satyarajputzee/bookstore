//
//  UIViewController+Alert.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import PromiseKit
import UIKit
import CocoaLumberjack
import SwinjectStoryboard

enum AlertResult {
    case action1, action2
}

extension UIViewController {
    
    private func canPresentAlert(_ topController: UIViewController?) -> Bool {
        return self.isViewLoaded && self.view.window != nil && (self == topController)
    }
    
    private func canPresentLoadingAlert(_ topController: UIViewController?) -> Bool {
        return self.isViewLoaded && (self == topController)
    }
    
    func tryPresentAlert(_ alertController: UIAlertController) -> Bool {
        let topController = UIApplication.topViewController()
        
        if self.canPresentAlert(topController) {
            self.present(alertController, animated: true, completion: nil)
            return true
        } else if self.canPresentLoadingAlert(topController) {
            self.present(alertController, animated: true, completion: nil)
            return true
        } else {
            let msg = "[\(type(of: self))] Cannot show alert \(alertController.contentToPrint) as top most VC: \(String(describing: topController)) is different than expected \(String(describing: self))"
            DDLogWarn(msg)
            return false
        }
    }

    @discardableResult
    func showAlert(title: String, message: String, action1Title: String? = nil, action2Title: String? = nil, action2Default: Bool = false) -> Promise<AlertResult> {
        return Promise { seal in
            let action1Title = action1Title ?? "OK"
            let action1 = UIAlertAction(title: action1Title, style: .default) { _ in
                DDLogInfo("[\(type(of: self))] User has tapped '\(action1Title)' on alert '\(title)' : '\(message)'")
                seal.fulfill(.action1)
            }
            
            var action2: UIAlertAction?
            if let title2 = action2Title {
                action2 = UIAlertAction(title: title2, style: .default) { _ in
                    DDLogInfo("[\(type(of: self))] User has tapped '\(title2)' on alert '\(title)' : '\(message)'")
                    seal.fulfill(.action2)
                }
            }
            showAlert(title: title, message: message, action1: action1, action2: action2, action2Default: action2Default, rejectAction: seal.reject)
        }
    }
    
    private func showAlert(title: String, message: String, action1: UIAlertAction, action2: UIAlertAction?, action2Default: Bool = false, rejectAction: @escaping (Error) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(action1)
        
        if let action2 = action2 {
            alertController.addAction(action2)
            if action2Default {
                alertController.preferredAction = action2
            }
        }
        
        if UIApplication.shared.applicationState == .active {
            if !self.tryPresentAlert(alertController) {
                rejectAction(AlertError.error(message: "Cannot show alert"))
            }
        } else if let alertScheduler = SwinjectStoryboard.defaultContainer.resolve(AlertScheduler.self) {
            alertScheduler.scheduleAlert(viewController: self, alertController: alertController, rejectAction: rejectAction)
        }
    }
}

extension UIAlertController {
    var contentToPrint: String { return "'\(title ?? "")' : '\(message ?? "")'" }
}
