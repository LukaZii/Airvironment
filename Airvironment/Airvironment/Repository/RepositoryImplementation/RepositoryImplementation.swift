//
//  RepositoryImplementation.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit

class RepositoryImplementation: Repository{
    

    
    
    var webDataSource: RemoteDataSource = AlamofireDataSource()
    
    
    func getCurrentWeather(result: @escaping ((Result<Weather, Error>) -> Void)) {
        webDataSource.getCurrentWeather(result: result)
        print("pozvao repository")
    }
    
    func getWeather(result: @escaping ((Result<Array<Weather>, Error>) -> Void)) {
        webDataSource.getWeather(result: result)
    }
    
    
}
