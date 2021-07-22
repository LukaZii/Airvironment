//
//  CellViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on 22.7.21..
//

import UIKit
import Kingfisher

class CellViewController: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pollutionLabel: UILabel!
    
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


  



    
