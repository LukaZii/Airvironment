//
//  ScreenOneViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit
import Kingfisher

class ScreenOneViewController: BaseViewController<ScreenOneViewModel> {

    @IBOutlet weak var LastUpdatedLabel: UILabel!
    
    @IBOutlet weak var TemperatureLabel: UILabel!
    @IBOutlet weak var HumidityLabel: UILabel!
    @IBOutlet weak var PollutionLabel: UILabel!
    @IBOutlet weak var ShowHistoryView: UIView!
    private var observer: NSKeyValueObservation!



    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel = ScreenOneViewModel(repository: RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    deinit {
        viewModel.timer.invalidate()
        viewModel.timer = nil
    }
    

    private func observeLiveData(){
        observer = viewModel.observe(\.weather, options: .new) { _, weather  in
            if let weather = weather.newValue{
                self.setScreen(weather: weather!)
            }
        }
    }
    
    private func setScreen(weather: Weather){
            var formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.LastUpdatedLabel.text = formater.string(from: weather.created)
            self.TemperatureLabel.text = "\(weather.temperature)"
            self.HumidityLabel.text = "\(weather.humidity)"
            self.PollutionLabel.text = "\(weather.pollution)"
        
        }
    
    @IBAction func buttonShowHistory(_ sender: Any) {
        navigationController!.show(ScreenTwoViewController(), sender: nil)
    }
}
    


    
    
