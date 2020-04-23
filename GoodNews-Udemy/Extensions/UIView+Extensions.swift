//
//  UIView+Extensions.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/23/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static func viewForTableViewHeader(title: String) -> UIView {
            
        let screenRect = UIScreen.main.bounds
        let subTitleView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.size.width, height: 44)))
        subTitleView.backgroundColor = .lightGray
        let subTitleLabel = UILabel(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: screenRect.size.width, height: 44)))
        subTitleLabel.text = title
        subTitleLabel.textAlignment = .center
        subTitleLabel.textColor = .white
        subTitleLabel.font = UIFont.fontForDateHeader()
        subTitleView.addSubview(subTitleLabel)
        return subTitleView
        
    }
    
    static func viewForSectionHeader(title: String) -> UIView {
        
        let screenRect = UIScreen.main.bounds
        let headerView = UIView(frame: CGRect(x: 15, y: 0, width: screenRect.width, height: 60))
        headerView.backgroundColor = .white
        let sectionHeaderLabel = UILabel(frame: headerView.frame)
        sectionHeaderLabel.text = title.uppercased()
        sectionHeaderLabel.font = UIFont.fontForSectionTitle()
        sectionHeaderLabel.textColor = .systemBlue
        headerView.addSubview(sectionHeaderLabel)
        return headerView
        
    }
    
}
