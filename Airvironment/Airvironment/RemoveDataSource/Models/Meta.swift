//
//  Meta.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 23.7.21..
//


import UIKit

class Meta: NSObject, Codable {
    var page: Int
    var per_page: Int
    var total: Int

    
    init(page: Int,
    per_page: Int,
    total: Int) {
        self.page = page
        self.per_page = per_page
        self.total = total
    
    }
    enum CodingKeys: String, CodingKey {
        case page
        case per_page
        case total
    }
}
