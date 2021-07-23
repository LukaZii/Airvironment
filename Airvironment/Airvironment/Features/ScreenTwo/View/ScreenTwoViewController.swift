//
//  ScreenTwoViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 8 on
import UIKit

class ScreenTwoViewController: BaseViewController<ScreenTwoViewModel> {
    
    
    @IBOutlet weak var weatherTableView: UITableView!
    private var observer: NSKeyValueObservation!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel = ScreenTwoViewModel(repository: RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherTableView.register(UINib(nibName: WeatherTableViewCell.reusableIdentifier(), bundle: nil),
                                  forCellReuseIdentifier: WeatherTableViewCell.reusableIdentifier())
        observeLiveData()
        viewModel.onViewDidLoad()
    }
    
    private func observeLiveData(){
        observer = viewModel.observe(\.weather, options: .new) { _, weather  in
            if let weather = weather.newValue{
                self.weatherTableView.dataSource = self
            }
        }
    }
}

extension ScreenTwoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weather!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.reusableIdentifier(), for: indexPath) as! WeatherTableViewCell
        if let weather = viewModel.weather {
            cell.configure(weather: weather[indexPath.row])
        }
        
        return cell
    }
    
}

