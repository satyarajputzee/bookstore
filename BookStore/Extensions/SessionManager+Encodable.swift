//
//  SessionManager+Encodable.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager {
    
    static let encoder = JSONEncoder()
    
    func request<T: Encodable>(_ url: URLConvertible,
                               method: Alamofire.HTTPMethod,
                               encodableParams: T,
                               headers: HTTPHeaders?) -> Alamofire.DataRequest {
        
        do {
            let urlRequest = try URLRequest(url: url, method: method, headers: headers)
            let encodedRequest = try encode(urlRequest, with: encodableParams)
            return self.request(encodedRequest)
        } catch {
            fatalError("Cannot issue request")
        }
    }
    
    private func encode<T: Encodable>(_ urlRequest: URLRequestConvertible, with parameters: T) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        do {
            if let stringValue = parameters as? String {
                urlRequest.httpBody = stringValue.data(using: .utf8)!
            } else {
                let encoded = try SessionManager.encoder.encode(parameters)
                urlRequest.httpBody = encoded
            }
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        return urlRequest
    }
}
