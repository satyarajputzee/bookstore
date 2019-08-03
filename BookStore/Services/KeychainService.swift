//
//  KeychainService.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import KeychainAccess

protocol KeychainService: class {
    func set(value: String?, key: String)
    func getString(_ key: String) -> String?
    func remove(_ key: String)
    func removeAll()
}

class KeychainServiceImpl: KeychainService {
    
    let keychain: Keychain
    
    init() {
        keychain = Keychain() // under the hood it uses BundleID as service name
    }
    
    func set(value: String?, key: String) {
        do {
            if let val = value {
                try keychain.set(val, key: key)
            } else {
                remove(key)
            }
        } catch let error {
            print("Keychain: cannot set key: \(key), error: \(error.localizedDescription)")
        }
    }
    
    func getString(_ key: String) -> String? {
        do {
            return try keychain.getString(key)
        } catch let error {
            print("Keychain: cannot get key: \(key), error: \(error.localizedDescription)")
            return nil
        }
    }
    
    func remove(_ key: String) {
        do {
            try keychain.remove(key)
        } catch let error {
            print("Keychain: cannot remove key: \(key), error: \(error.localizedDescription)")
        }
    }
    
    func removeAll() {
        do {
            try keychain.removeAll()
        } catch let error {
            print("Keychain: cannot remove all keys, error: \(error.localizedDescription)")
        }
    }
}
