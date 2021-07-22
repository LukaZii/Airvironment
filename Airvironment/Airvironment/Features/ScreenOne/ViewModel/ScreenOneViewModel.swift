//
//  ScreenOneViewModel.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit

class ScreenOneViewModel: NSObject{
    
    var repository: Repository!
    @objc dynamic var weather: Weather?
    
    
    init(repository:Repository){
        self.repository = repository
    }
    
    func onViewDidLoad(){
        getCurrentWeather()
    }
    
    func getCurrentWeather(){
       print("pozvao vm")
        repository.getCurrentWeather() { result in
            switch result {
            case .success(let weather):
                print("success vm")
                self.weather = weather
            case .failure(let error):
                print("failure vm")
                break
            }
        }
    }
}
    
