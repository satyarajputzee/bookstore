//
//  AlertScheduler.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import AVKit
import CocoaLumberjack
import UIKit
import SwinjectStoryboard

class AlertScheduler {
    private var scheduledAlerts = [AlertSchedule]()
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    deinit {
        // Not required on iOS9+, but won't hurt
        NotificationCenter.default.removeObserver(self)
    }
    
    func scheduleAlert(viewController: UIViewController, alertController: UIAlertController, rejectAction: @escaping (Error) -> Void) {
        self.scheduledAlerts.append(AlertSchedule(viewController: viewController, alertController: alertController, rejectAction: rejectAction))
    }
    
    @objc func applicationDidBecomeActive() {
        guard scheduledAlerts.count > 0 else {
            return
        }
        
        for alert in scheduledAlerts {
            guard let vc = alert.viewController else {
                let msg = "UIViewController associated with alert \(alert.alertController.contentToPrint) is not available."
                DDLogInfo("[AlertScheduler] \(msg)")
                alert.rejectAction(AlertError.error(message: msg))
                continue
            }
            if !vc.tryPresentAlert(alert.alertController) {
                alert.rejectAction(AlertError.error(message: "Cannot show alert"))
            }
        }
        scheduledAlerts.removeAll()
    }
}

class AlertSchedule {
    weak var viewController: UIViewController?
    var alertController: UIAlertController
    var rejectAction: (Error) -> Void
    
    init (viewController: UIViewController, alertController: UIAlertController, rejectAction: @escaping (Error) -> Void) {
        self.viewController = viewController
        self.alertController = alertController
        self.rejectAction = rejectAction
    }
}
