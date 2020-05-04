//
//  WeatherNetworkManager.swift
//  WeatherApp+MVVM
//
//  Created by rau4o on 5/4/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import Moya

enum WeatherNetworkManager {
    case fetchCurrentWeather(city: String)
    case fetchCurrentLocationWeather(lat: String, lon: String)
}

extension WeatherNetworkManager: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.openweathermap.org/data/2.5/")!
    }
    
    var path: String {
        switch self {
        case .fetchCurrentWeather:
            return "weather"
        case .fetchCurrentLocationWeather:
            return "weather"
        }
    }
    
    var method: Method {
        switch self {
        case .fetchCurrentWeather:
            return .get
        case .fetchCurrentLocationWeather:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchCurrentWeather(let city):
            return .requestParameters(parameters: ["q": city, "APPID": NetworkProperties.API_KEY], encoding: URLEncoding.default)
        case .fetchCurrentLocationWeather(let lat, let lon):
            return .requestParameters(parameters: ["lat": lat, "lon": lon, "APPID": NetworkProperties.API_KEY], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
