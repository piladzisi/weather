//
//  WeatherModel.swift
//  Clima
//
//  Created by Old Mac on 11/25/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
   
    let weatherURL = "api.openweathermap.org/data/2.5/weather?appid=5d3c281f8b7ece9515e8f1dac20c6b1b&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}

   
