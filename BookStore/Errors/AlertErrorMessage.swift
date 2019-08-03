//
//  AlertErrorMessage.swift
//  BookStore
//
//  Created by Abhishek Singh on 31/07/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

enum ErrorMessage: String {
    //MARK: Generic Message
    case unexpectedError = "Sorry, there was an unexpected error. Please try again later."
    case connectionError = "Please check if you have an internet connection and try again"
    case alertTitle = "Oops"
    //MARK: Login Message
    case loginFailed = "Looks like either your email or password were incorrect."
}
