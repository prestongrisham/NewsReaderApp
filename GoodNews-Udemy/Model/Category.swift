//
//  Category.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation

struct Category {
    
    let title: String
    let articles: [Article]
    
    static func all() -> [String] {
        return ["Business", "Entertainment", "General", "Sports", "Technology"]
    }
    
    static func select(list: [String]) -> [String] {
        return list
    }
    
}
