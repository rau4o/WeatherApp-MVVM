//
//  Float+Extension.swift
//  WeatherApp+MVVM
//
//  Created by rau4o on 5/4/20.
//  Copyright © 2020 rau4o. All rights reserved.
//

import UIKit

extension Float {
    func truncate(places : Int)-> Float {
        return Float(floor(pow(10.0, Float(places)) * self)/pow(10.0, Float(places)))
    }
    
    func kelvinToCeliusConverter() -> Float {
        let constantVal : Float = 273.15
        let kelValue = self
        let celValue = kelValue - constantVal
        return celValue.truncate(places: 1)
    }
}
