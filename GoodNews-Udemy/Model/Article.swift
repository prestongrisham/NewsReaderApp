//
//  Article.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation

struct NewsSourcesResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
}

struct Article: Decodable {
    
    let title: String
    let description: String?
    let url: String?
    let imageURL: String?
    let sourceName: String
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case description
        case url
        case imageURL = "urlToImage"
        case source
    }
    
    private enum SourceKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try container.decode((String.self), forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.url = try? container.decode(String.self, forKey: .url)
        self.imageURL = try? container.decode(String.self, forKey: .imageURL)
        
        let sourceContainer = try container.nestedContainer(keyedBy: SourceKeys.self, forKey: .source)
        self.sourceName = try sourceContainer.decode(String.self, forKey: .name)
        
    }
    
    static func by(_ category: String) -> Resource<[Article]> {
        return Resource<[Article]>(url: URL.urlForTopHeadlines(for: category)) { data in
            return try! JSONDecoder().decode(NewsSourcesResponse.self, from: data).articles
        }
    }
    
}
