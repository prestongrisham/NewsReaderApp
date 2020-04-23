//
//  ArticleViewModel.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation
import UIKit

struct ArticleViewModel {
    
    private(set) var article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String? {
        return self.article.description
    }
    
    func image(completion: @escaping (UIImage?) -> ()) {
        guard let imageURL = article.imageURL else {
            completion(nil)
            return
        }
        
        UIImage.imageForHeadline(url: imageURL) { (image) in
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
}

