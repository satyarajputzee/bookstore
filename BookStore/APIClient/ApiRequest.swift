//
//  ApiRequest.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Alamofire
import PromiseKit
import CocoaLumberjack

internal class ApiRequest {
    
    // MARK: instance properties
    
    let manager: SessionManager
    let baseHeaders: [String: String]?
    
    
    // MARK: constructor
    
    public init(manager: SessionManager, baseHeaders: [String: String]?) {
        self.manager = manager
        self.baseHeaders = baseHeaders
    }
    
    func executeRequest<Result: Decodable> (_ resultType: Result.Type, url: String, method: Alamofire.HTTPMethod, parameters: [String: Any]?, encoding: ParameterEncoding, headers: [String: String]) -> Promise<Result> {
        return executeRequest(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .map { data -> Result in
                return try ApiRequest.parseResponse(data, url, method.rawValue)
        }
    }
    
    private func executeRequest(_ url: String, method: Alamofire.HTTPMethod, parameters: [String: Any]?, encoding: ParameterEncoding, headers: [String: String]) -> Promise<Data> {
        
        let httpHeaders = prepareHeaders(headers: headers)
        let request = manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: httpHeaders)
        
        DDLogInfo("--> \(method.rawValue) \(url)\n\(String(data: request.request?.httpBody ?? Data(), encoding: .utf8)!)")
        return request.asPromise(url, method.rawValue)
    }
    
    // MARK: Prepare Headers
    private func prepareHeaders(headers: [String: String]) -> [String: String] {
        var httpHeaders = baseHeaders ?? [String: String]()
        for (key, value) in headers {
            httpHeaders[key] = value
        }
        return httpHeaders
    }
    
    // MARK: Parse Response
    private static func parseResponse<Result: Decodable>(_ data: Data, _ url: String, _ method: String) throws -> Result {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(Result.self, from: data)
            return result
        } catch {
            DDLogInfo("<-- (parse error) \(method) \(url)\nError: \(error)\n\(String(data: data, encoding: .utf8) ?? data.description)")
            throw ApiError.transformFailed
        }
    }
}
