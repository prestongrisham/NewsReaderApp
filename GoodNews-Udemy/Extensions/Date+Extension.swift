//
//  Date+Extension.swift
//  GoodNews-Udemy
//
//  Created by Preston Grisham on 4/23/20.
//  Copyright © 2020 Preston Grisham. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateAsStringForTableViewHeader() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, YYYY"
        return formatter.string(from: Date())
        
    }
    
}
