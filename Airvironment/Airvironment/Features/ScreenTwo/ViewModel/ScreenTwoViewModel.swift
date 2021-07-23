//
//  ScreenTwoViewModel.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit

class ScreenTwoViewModel: BaseViewModel{
    
    var repository: Repository
    @objc dynamic var weather: Array<Weather>?

    
    init (repository: Repository){
        self.repository = repository
    }
    
    func onViewDidLoad(){
        getWeather()
    }
    
    private func getWeather() {
        loading = true
        repository.getWeather() { result in
            switch result {
            case.success(let weather):
                self.weather = weather.response
            case.failure(let error):
                break
            }
            self.loading = false
        }
    }
}

