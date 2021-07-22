//
//  ScreenOneViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit
import Kingfisher

class ScreenOneViewController: UIViewController {

    @IBOutlet weak var LastUpdatedLabel: UILabel!
    
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var PollutionLabel: UILabel!
    @IBOutlet weak var ShowHistoryView: UIView!
    private var observer: NSKeyValueObservation!


    let firstScreenViewModel: ScreenOneViewModel = ScreenOneViewModel(repository: RepositoryImplementation())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        firstScreenViewModel.onViewDidLoad()
    }

    private func observeLiveData(){
        observer = firstScreenViewModel.observe(\.weather, options: .new) { _, weather  in
            if let weather = weather.newValue{
                self.setScreen(weather: weather!)
            }
        }
    }
    
    private func setScreen(weather: Weather){
            self.LastUpdatedLabel.text = weather.created
            self.TemperatureLabel.text = "\(weather.temperature)"
            self.HumidityLabel.text = "\(weather.humidity)"
            self.PollutionLabel.text = "\(weather.pollution)"
        }
}
    


    
    
