//
//  GetLoginResponse.swift
//  BookStore
//
//  Created by Abhishek Singh on 30/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

struct GetLoginResponse: Decodable {
    let success: Bool
    let token: String?
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case success
        case token
        case message = "msg"
    }
}
