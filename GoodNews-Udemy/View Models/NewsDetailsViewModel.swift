//
//  NewsDetailsViewModel.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/23/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation


struct NewsDetailsViewModel {
    
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var sourceName: String {
        return self.article.sourceName
    }
    
    var url: String? {
        return self.article.url
    }
}
