//
//  SwinjectStoryboard+Setup.swift
//  BookStore
//
//  Created by Abhishek Singh on 29/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

extension SwinjectStoryboard {
   
    @objc class func setup() {

        //MARK: View Controllers
        defaultContainer.storyboardInitCompleted(UINavigationController.self) { _, _ in
            // just a dummy registration to suppress warnings from SwinjectStoryboard
        }
        defaultContainer.storyboardInitCompleted(LoginViewController.self) { r, c in
            c.viewModel = r.resolve(LoginViewModel.self)
        }
        defaultContainer.storyboardInitCompleted(BooksCollectionViewController.self) { r, c in
            c.viewModel = r.resolve(BooksCollectionViewModel.self)
        }
        defaultContainer.storyboardInitCompleted(CreateBookViewController.self) { r, c in
            c.viewModel = r.resolve(CreateBookViewModel.self)
        }
        
        //MARK: View Models
        defaultContainer.autoregister(LoginViewModel.self, initializer: LoginViewModel.init).inObjectScope(ObjectScope.transient)
        defaultContainer.autoregister(BooksCollectionViewModel.self, initializer: BooksCollectionViewModel.init).inObjectScope(ObjectScope.transient)
        defaultContainer.autoregister(CreateBookViewModel.self, initializer: CreateBookViewModel.init).inObjectScope(ObjectScope.transient)

        //MARK: Services
        defaultContainer.autoregister(LocalSettings.self, initializer: LocalSettingsImpl.init).inObjectScope(ObjectScope.container)
        defaultContainer.autoregister(KeychainService.self, initializer: KeychainServiceImpl.init).inObjectScope(ObjectScope.container)
        defaultContainer.autoregister(BookStoreApiClient.self, initializer: BookStoreApiClient.init).inObjectScope(ObjectScope.container)
        
    }
}
