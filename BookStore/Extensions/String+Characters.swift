//
//  String+Characters.swift
//  BookStore
//
//  Created by Abhishek Singh on 02/08/19.
//  Copyright © 2019 Abhishek Singh. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
