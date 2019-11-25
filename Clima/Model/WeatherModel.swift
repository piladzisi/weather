//
//  WeatherModel.swift
//  Clima
//
//  Created by Old Mac on 11/25/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
    
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}

struct Wind: Decodable {
    let speed: Double
    let deg: Int
}
