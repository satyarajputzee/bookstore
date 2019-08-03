//
//  Book.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

class Book {
    let id: String
    let isbn: String
    let title: String
    let author: String
    let publisher: String
    let image: String

    init(id: String, isbn: String, title: String, author: String, publisher: String, image: String) {

        self.id = id
        self.isbn = isbn
        self.title = title
        self.author = author
        self.publisher = publisher
        self.image = image
        
    }
}
