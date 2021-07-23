//
//  ScreenOneViewModel.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit

class ScreenOneViewModel: BaseViewModel{
    
    var repository: Repository!
    @objc dynamic var weather: Weather?
    
    
    var timer:Timer!
    
    init(repository:Repository){
        self.repository = repository
    }
    
    func onViewDidLoad(){
        getCurrentWeather()
        self.timer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(getCurrentWeather), userInfo: nil, repeats: true)
    }
    
    @objc func getCurrentWeather(){
       loading = true
        repository.getCurrentWeather() { result in
            switch result {
            case .success(let weather):
                self.weather = weather
                self.loading = false
            case .failure(let error):
                self.loading = false
            }
        }
    }
}
    
