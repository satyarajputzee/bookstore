//
//  ApiClient.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Alamofire
import PromiseKit


class ApiClient {
    
    // MARK: instance properties
    
    let localSettings: LocalSettings
    let manager: SessionManager
    
    // MARK: constructors
    
    init(manager: SessionManager = SessionManager.default,
         operationQueue: OperationQueue = OperationQueue.main,
         localSettings: LocalSettings) {
        
        self.localSettings = localSettings
        self.manager = manager
    }
    
    func executeRequest<Result: Decodable> (_ resultType: Result.Type, url: String, method: Alamofire.HTTPMethod, headers: [String: String], withManager customManager: SessionManager? = nil) -> Promise<Result> {
            return self.createRequest(withManager: customManager).executeRequest(resultType, url: url, method: method, parameters: nil, encoding: URLEncoding.default, headers: headers)
    }
    
    // MARK: helper methods
    func createRequest(withManager customManager: SessionManager? = nil, addAuthorization: Bool = true) -> ApiRequest {
       
        let sessionManager: SessionManager = customManager ?? manager
        var baseHeaders = [String: String]()
        if addAuthorization {
            for (key, value) in getAuthorizationHeaders() {
                baseHeaders[key] = value
            }
        }
        baseHeaders[HttpConstants.Header.Accept] = HttpConstants.ContentType.Json
        let request = ApiRequest(manager: sessionManager, baseHeaders: baseHeaders)
        return request
    }
    
    // MARK: private methods
    private func getAuthorizationHeaders() -> [String: String] {
        
        guard let authToken = localSettings.authToken else {
            fatalError("Invalid operation. Missing OAuth token.")
        }
        let accessToken:String = "eyJ0eXAiOiJqd3QiLCJhbGciOiJIUzI1NiJ9.eyJwcm9kdWN0X2NvZGUiOiJ6ZWU1QDk3NSIsInBsYXRmb3JtX2NvZGUiOiJAbmRyb2lkQHBwQDEyMyIsImlzc3VlZEF0IjoiMjAyMC0xMi0yMVQwMDozMDowMiswMDAwIiwidHRsIjo4NjQwMH0.v5AgePPtDRAPwZBnaWeHXaKpSOhqc9B2pMOl8kzsgUM"

        let headers = [HttpConstants.Header.accessToken:accessToken ]
        
        return headers
    }
}
