//
//  WeatherNetworkService.swift
//  WeatherApp+MVVM
//
//  Created by rau4o on 5/4/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Foundation
import Moya

class WeatherNetworkService: NSObject {
    
    static let shared = WeatherNetworkService()
    var weatherNetworkManager = MoyaProvider<WeatherNetworkManager>()
    
    func fetchCurrentWeather(city: String,completion: @escaping (WeatherModel,Error?) -> Void ) {
        weatherNetworkManager.request(.fetchCurrentWeather(city: city)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let weather = try JSONDecoder().decode(WeatherModel.self, from: response.data)
                    completion(weather,nil)
                } catch(let error) {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
