//
//  LocalSettings.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

protocol LocalSettings: class {
    var authToken: String? { get set }
}

class LocalSettingsImpl: LocalSettings {
    
    private enum LocalSettingsKey: String {
        case authToken
    }
    
    var keychainService: KeychainService
    
    init(keychainService: KeychainService) {
        self.keychainService = keychainService
    }
}


//MARK: - settings in keychain
extension LocalSettingsImpl {
    
    //MARK: - Login Credentials
    var authToken: String? {
        get {
            return keychainService.getString(LocalSettingsKey.authToken.rawValue)
        }
        set {
            keychainService.set(value: newValue, key: LocalSettingsKey.authToken.rawValue)
        }
    }
}
