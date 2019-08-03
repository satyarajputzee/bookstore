//
//  GetCreateBookResponse.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

struct GetCreateBookResponse: Decodable {
    let success: Bool
    let message: String
    
    private enum CodingKeys: String, CodingKey {
        case success
        case message = "msg"
    }
}
