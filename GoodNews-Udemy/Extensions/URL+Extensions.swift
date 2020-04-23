//
//  URL+Extensions.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForTopHeadlines(for category: String) -> URL {
        return URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&pageSize=30&apiKey=3a2b61ce350b4d67ac76a4b23a6cd336")!
    }
    
}
