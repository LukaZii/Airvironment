//
//  WeatherTableViewCell.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 23.7.21..
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var pollutionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(weather: Weather){
        temperatureLabel.text = "\(weather.temperature)"
        humidityLabel.text = "\(weather.humidity)"
        pollutionLabel.text = "\(weather.pollution)"

    }
}

extension UITableViewCell {
    static func reusableIdentifier() -> String {
        String(describing: Self.self)
    }
    
}
