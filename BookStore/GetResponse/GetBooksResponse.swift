//
//  GetBooksResponse.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

struct GetBooksResponse: Decodable {
    let id: String
    let isbn: String
    let title: String
    let author: String
    let publisher: String
    let image: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case isbn
        case title
        case author
        case publisher
        case image
    }
}

