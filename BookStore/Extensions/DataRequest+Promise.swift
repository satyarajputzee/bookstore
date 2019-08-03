//
//  DataRequest+Promise.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Alamofire
import Foundation
import PromiseKit

extension DataRequest {
    func asPromise(_ url: String, _ method: String) -> Promise<Data> {
        self.validate()
        return Promise(resolver: { seal in
            self.responseData { response in
                switch response.result {
                case .success(let result):
                    print("<-- \(method) \(url)\n\(String(data: result, encoding: .utf8) ?? result.description)")
                    seal.fulfill(result)
                case .failure(let error):
                    print("<-- (error) \(method) \(url)\nError: \(error)\n\(String(data: response.data ?? Data(), encoding: .utf8) ?? "")")
                    let apiError = ApiError.generateApiError(response.response, error: error)
                    seal.reject(apiError)
                }
            }
        })
    }
}
