//
//  MetaWeather.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 23.7.21..
//

import UIKit

class MetaWeather: NSObject, Codable {
    var meta: Meta
    var response: Array<Weather>

    
    init(meta: Meta,
    response: Array<Weather>) {
        self.meta = meta
        self.response = response
    }
    enum CodingKeys: String, CodingKey {
        case meta
        case response
    }
}
