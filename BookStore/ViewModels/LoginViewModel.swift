//
//  LoginViewModel.swift
//  BookStore
//
//  Created by Abhishek Singh on 29/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import PromiseKit

enum LoginValidationMessages: String {
    case error = "Please enter a valid username/password."
}

class LoginViewModel {
    
    private let bookStoreApiClient: BookStoreApiClient
    private let localSettings: LocalSettings
    
    init(bookStoreApiClient: BookStoreApiClient, localSettings: LocalSettings) {
        self.bookStoreApiClient = bookStoreApiClient
        self.localSettings = localSettings
    }
    
    func allValid(userName: String?, password: String?) -> Bool {
        guard let userName = userName, let password = password else {
            return  false
        }
        if userName.trim().count == 0 {
            return  false
        }
        if password.count == 0 {
            return  false
        }
        return true
    }
    func getTVShow()-> Promise<TVShow>
    {
        return self.bookStoreApiClient.GetTVShow()
            .map ({ (tvs) -> TVShow in
                return tvs
            })

    
    }
    func login(userName: String, password: String) -> Promise<GetLoginResponse> {
        return self.bookStoreApiClient.login(userName: userName, password: password)
    }
    
    func updateToken(token: String)  {
        self.localSettings.authToken = token
    }
}
