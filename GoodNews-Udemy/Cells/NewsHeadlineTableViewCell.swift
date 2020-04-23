//
//  NewsHeadlineTableViewCell.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/21/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation
import UIKit

class NewsHeadlineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var headlineImageView: UIImageView!
    
    func configure(vm: ArticleViewModel) {
        self.titleLabel.text = vm.title
        self.descriptionLabel.text = vm.description
        vm.image { self.headlineImageView.image = $0 }
    }
}
