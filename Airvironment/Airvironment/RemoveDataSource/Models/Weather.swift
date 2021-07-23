//
//  Weather.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit

class Weather: NSObject, Codable {
    var created: Date
    var id: Int
    var temperature: Float
    var humidity: Float
    var pollution: Float
    
    init(created: Date,
    id: Int,
    temperature: Float,
    humidity: Float,
    pollution: Float) {
        self.created = created
        self.id = id
        self.temperature = temperature
        self.humidity = humidity
        self.pollution = pollution
    
    }
    enum CodingKeys: String, CodingKey {
        case created
        case id
        case temperature
        case humidity
        case pollution
    }
    
    
}
