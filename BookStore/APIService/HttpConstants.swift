//
//  HttpConstants.swift
//  BookStore
//
//  Created by Abhishek Singh on 29/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

/** Provides constants for working with the HTTP protocol. */
open class HttpConstants {
    
    public class Header {
        
        /** The Authorization header key for HTTP request. */
        public static let Authorization = "Authorization"
        
        public static let accessToken = "x-access-token"
        
        public static let guestToken = "X-Z5-Guest-Token"
                
        /** The Content-Type header key for HTTP request. */
        public static let ContentType = "Content-Type"
        
        /** The Accept header key for HTTP request. */
        public static let Accept = "Accept"
        
        fileprivate init() {}
    }
    
    public class ContentType {
        
        /** A content type for url-encoded form data */
        public static let FormUrlEncoded = "application/x-www-form-urlencoded"
        
        /** A content type for url-encoded form data */
        public static let Json = "application/json"
        
        fileprivate init() {}
    }
    
    
    // MARK: constructors
    fileprivate init() {}
}
