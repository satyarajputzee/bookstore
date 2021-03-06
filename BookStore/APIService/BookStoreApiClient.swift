//
//  BookStoreAPIService.swift
//  BookStore
//
//  Created by Abhishek Singh on 29/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit


class BookStoreApiClient: ApiClient {
    
    private let baseUrl: String = BookStoreAPIUrls.baseUrl.rawValue
    private let timeOutInterval = 30.0
    private var sessionManager: SessionManager
    
    // MARK: constructors
    init(localSettings: LocalSettings) {
        self.sessionManager = BookStoreApiClient.createConfiguredAFManager(timeout: timeOutInterval)
        super.init(manager: BookStoreApiClient.createConfiguredAFManager(timeout: timeOutInterval), localSettings: localSettings)
    }
    
    // MARK: Login
    func login(userName: String, password: String) -> Promise<GetLoginResponse> {
        
        let parameters = [ "username" : userName,
                           "password" : password ]
        
        let url = baseUrl + BookStoreAPIUrls.signIn.rawValue
        return createRequest(addAuthorization: false).executeRequest(GetLoginResponse.self, url: url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:])
    }
    
    // MARK: GetBooks
    func getBooks() -> Promise<[GetBooksResponse]> {
        
        let url = baseUrl + BookStoreAPIUrls.book.rawValue
        return createRequest(addAuthorization: true).executeRequest([GetBooksResponse].self, url: url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: [:])
    }
    
    // MARK: Create Book
    func createBook(newBook: Book) -> Promise<GetCreateBookResponse> {
       
        let parameters = [ "isbn" : newBook.isbn,
                           "title" : newBook.title,"author" : newBook.author,
                           "publisher" : newBook.publisher, "image" : newBook.image ]
       
        let url = baseUrl + BookStoreAPIUrls.book.rawValue
        return createRequest(addAuthorization: true).executeRequest(GetCreateBookResponse.self, url: url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:])
    }


    // MARK: Private methods
    private static func createConfiguredAFManager(timeout: TimeInterval) -> Alamofire.SessionManager {
        
        // create manager with timeout configured
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = timeout
        config.timeoutIntervalForResource = timeout
        config.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let manager = Alamofire.SessionManager(configuration: config)
        return manager
    }
}

