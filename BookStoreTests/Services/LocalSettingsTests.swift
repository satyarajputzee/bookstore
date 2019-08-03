//
//  LocalSettingsTests.swift
//  BookStoreTests
//
//  Created by Abhishek Singh on 02/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import XCTest
@testable import BookStore

class LocalSettingsTests: XCTestCase {

    private let instance = LocalSettingsImpl(keychainService: KeychainServiceImpl())
    
    func testToken() {
        // Capture current value
        let oldValue = instance.authToken
        
        // Verify if values are stored correctly
        let testingAuthToken = "5d109ae3774596001add0919ddaddda88y8adda8686addad86ada86dadfvfvy8886vvvv868vvfdbnjjhg8871SSjjjyfyt7767GHVHY777"
        instance.authToken = testingAuthToken
        
        guard let token = instance.authToken else {
            return
        }
        XCTAssertEqual(instance.authToken, token)
        
        let fakeAuthToken = "vfvy88jyfyt7767GHv868vvf6dadfvfvy88db001ad6dadfvfvy88d0919ddad5d16dadfvfvy8809ae37745jyfyt7767GHdfvfvy88jyfyt7767G"
        XCTAssertNotEqual(instance.authToken, fakeAuthToken)
        
        // Restore original value
        instance.authToken = oldValue
    }

}
