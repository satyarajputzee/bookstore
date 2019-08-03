//
//  CreateBookViewModel.swift
//  BookStore
//
//  Created by Abhishek Singh on 01/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import PromiseKit

enum CreateBookValidationMessages: String {
    case error = "Please enter valid inputs to create new book."
}

enum CreateBookSuccessMessages: String {
    case message = "Successful created new book."
}

class CreateBookViewModel {
    
    private let bookStoreApiClient: BookStoreApiClient
    
    init(bookStoreApiClient: BookStoreApiClient) {
        self.bookStoreApiClient = bookStoreApiClient
    }
    
    // MARK: Validation Method
    func allValid(isbn: String?, title: String?, author: String?, publisher: String?, image: String?) -> Bool {
        
        guard let isbn = isbn, let title = title, let author = author, let publisher = publisher, let image = image  else {
            return  false
        }
        if isbn.trim().count == 0 {
            return  false
        }
        if title.trim().count == 0 {
            return  false
        }
        if publisher.trim().count == 0 {
            return  false
        }
        if author.trim().count == 0 {
            return  false
        }
        if image.trim().count == 0 {
            return  false
        }

        return true
    }
    
    // MARK: Create Book
    func createBook(isbn: String, title: String, author: String, publisher: String, image: String) -> Promise<GetCreateBookResponse> {
        // for creating new book dont have id right now, so just pass blank "" value, as creating new book does not require id.
        let newBook = Book(id: "", isbn: isbn, title: title, author: author, publisher: publisher, image: image)
        return self.bookStoreApiClient.createBook(newBook: newBook)
    }
}
