//
//  MainViewModel.swift
//  WeatherApp+MVVM
//
//  Created by rau4o on 5/4/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation

class MainViewModel {
    
    private var weatherModel: WeatherModel? {
        didSet {
            guard let weather = weatherModel else {return}
            self.setupText(with: weather)
            self.didFinishLoadData?()
        }
    }
    
    var currentLocationTextViewModel: String?
    var currentTimeTextViewModel: String?
    var currentTemperatureTextViewModel: String?
    var tempDescriptionTextViewModel: String?
    var maxTempTextViewModel: String?
    var minTempTextViewModel: String?
    
    var didFinishLoadData: (() -> ())?
    
    func loadData(city: String) {
        WeatherNetworkService.shared.fetchCurrentWeather(city: city) { (weather, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.weatherModel = weather
            }
        }
    }
    
    private func setupText(with weather: WeatherModel) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        let stringDate = formatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.dt)))
        self.currentTemperatureTextViewModel = (String(weather.main.temp.kelvinToCeliusConverter()) + "°C")
        self.currentLocationTextViewModel = "\(weather.name ?? ""), \(weather.sys.country ?? "")"
        self.tempDescriptionTextViewModel = weather.weather[0].description
        self.currentTimeTextViewModel = stringDate
        self.minTempTextViewModel = ("Min: " + String(weather.main.temp_min.kelvinToCeliusConverter()) + "°C")
        self.maxTempTextViewModel = ("Max: " + String(weather.main.temp_max.kelvinToCeliusConverter()) + "°C")
    }
}
