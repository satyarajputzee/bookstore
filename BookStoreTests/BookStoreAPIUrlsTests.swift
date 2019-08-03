//
//  BookStoreTests.swift
//  BookStoreTests
//
//  Created by Abhishek Singh on 02/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import XCTest
@testable import BookStore

class BookStoreAPIUrlsTests: XCTestCase {

    func testUrl() {
        XCTAssertEqual(BookStoreAPIUrls.baseUrl.rawValue, "http://13.70.7.71:8080/")
        XCTAssertEqual(BookStoreAPIUrls.signIn.rawValue, "api/signin")
        XCTAssertEqual(BookStoreAPIUrls.book.rawValue, "api/book")
    }
}
