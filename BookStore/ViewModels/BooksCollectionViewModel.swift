//
//  BooksCollectionViewModel.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation
import PromiseKit

class BooksCollectionViewModel {
    
    private let bookStoreApiClient: BookStoreApiClient
    
    init(bookStoreApiClient: BookStoreApiClient) {
        self.bookStoreApiClient = bookStoreApiClient
    }
    
    // MARK: Get books
    func getBooks() -> Promise<[Book]> {
        
        return self.bookStoreApiClient.getBooks()
            .map({ (response) -> [Book] in
                return response.compactMap({ (book) -> Book in
                    Book(id: book.id, isbn: book.isbn, title: book.title, author: book.author, publisher: book.publisher, image: book.image)
                })
        })
    }
}
