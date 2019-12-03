//
//  WeatherModel.swift
//  Clima
//
//  Created by Old Mac on 11/25/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}

struct Wind: Codable{
    let speed: Double
    
}
