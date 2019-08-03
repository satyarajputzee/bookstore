//
//  ApiErrror.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation


enum ApiError: Error {
   
    case authenicationFailure
    case transformFailed
    case serverFailure
    case requestFailure
    case connectionFailure
    case offline
    case requestTimeOut
    
    
    static func generateApiError(_ response: HTTPURLResponse?, error: Error?) -> ApiError {
        
        if let apiError = error as? ApiError {
            return apiError
        }
        
        if let statusCode = response?.statusCode {
            switch statusCode {
            case 400, 404:
                return .requestFailure
            case 401, 403:
                return .authenicationFailure
            case 500...:
                return .serverFailure
            default:
                return .requestFailure
            }
        } else if error?.code == -1009 {
            return .offline
        } else if error?.code == -1001 {
            return .requestTimeOut
        } else if error != nil {
            return .connectionFailure
        } else {
            return .serverFailure
        }
    }
}

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
