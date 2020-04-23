//
//  CategoryService.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation

class CategoryService {
    
    func getAllHeadlinesForAllCategories(completion: @escaping ([Category]) -> ()) {
        
        var categories = [Category]()
        var requestCount = 0
        
        Category.all().forEach { category in
            WebService().load(Article.by(category)) { (articles) in
                requestCount += 1
                guard let articles = articles else { return }
                let category = Category(title: category, articles: articles)
                categories.append(category)
                
                if requestCount == Category.all().count {
                    DispatchQueue.main.async {
                        completion(categories)
                    }
                }
            }
        }
    }
    
    func getAllHeadlinesForSelectCategories(list: [String], completion: @escaping ([Category]) -> ()) {
        
        var categories = [Category]()
        var requestCount = 0
        
        Category.select(list: list).forEach { category in
            WebService().load(Article.by(category)) { (articles) in
                requestCount += 1
                guard let articles = articles else { return }
                let category = Category(title: category, articles: articles)
                categories.append(category)
                
                if requestCount == Category.select(list: list).count {
                    DispatchQueue.main.async {
                        completion(categories)
                    }
                }
            }
        }
    }
    
    func getHeadlinesForCategory(category: String, completion: @escaping ([Article]) -> ()) {
        
        WebService().load(Article.by(category)) { (articles) in
            guard let articles = articles else { return }
            DispatchQueue.main.async {
                completion(articles)
            }
        }
    }
}
