//
//  AlamofireDataSource.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit
import Alamofire

class AlamofireDataSource: RemoteDataSource {
    
    func getWeather(result: @escaping ((Result<MetaWeather, Error>) -> Void)) {
        AF.request(Router.Weather.getWeather, interceptor: nil).response{ serverResponse in
            switch serverResponse.result {
            case.success(_):
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: MetaWeather = try jsonDecoder.decode(MetaWeather.self, from: serverResponse.data!) as MetaWeather
                    result(.success(responseBody))
                } catch let error {
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
    }
    
    func getCurrentWeather(result: @escaping ((Result<Weather, Error>) -> Void)) {
        AF.request(Router.Weather.getCurrentWeather, interceptor: nil).response{ serverResponse in
            switch serverResponse.result {
            case.success(_):
                
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .custom(JSONDecoder.dateDecodingStrategy)
                    let responseBody: Weather = try jsonDecoder.decode(Weather.self, from: serverResponse.data!) as Weather
                    result(.success(responseBody))
                } catch let error {
                    
                    result(.failure(error))
                }
            case.failure(let error):
                result(.failure(error))
            }
        }
        
    }
    
}
