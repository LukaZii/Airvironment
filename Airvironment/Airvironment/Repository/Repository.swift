//
//  Repository.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit

protocol Repository {
    
    
    func getWeather(result: @escaping ((Result<MetaWeather, Error>) -> Void))
    
    func getCurrentWeather(result: @escaping ((Result<Weather, Error>) -> Void))
    
  
    
}
