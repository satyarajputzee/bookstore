//
//  BookStoreAPIUrls.swift
//  BookStore
//
//  Created by Abhishek Singh on 29/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

enum BookStoreAPIUrls: String {
    
    case baseUrl = "http://13.70.7.71:8080/" // Base Url
    case signIn = "api/signin" // Signin
    case book = "api/book" // Book Collection
    
    case urlx = "https://gwapi.zee5.com/content/collection/0-8-3367?page=3&limit=10&item_limit=20&translation=en&country=IN&languages=kn%2Chi%2Cte%2Cbn%2Cml%2Cen%2Cmr&version=9"
    case url_tvshows = "https://gwapi.zee5.com/content/collection/0-8-tvshows?page=1&limit=10&item_limit=20&translation=en&country=IN&version=9&languages=hi,en&"
}
