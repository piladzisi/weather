//
//  WeatherModel.swift
//  Clima
//
//  Created by Old Mac on 11/25/19.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation


struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5d3c281f8b7ece9515e8f1dac20c6b1b&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        //        1. Create URL
        //        2. Create a URLsession
        //        3. Give the session a task
        //        4. Start the task
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default) //the thing that can perform networking, like browser
            let task = session.dataTask(with: url) { (data, rsponse, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
           let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.wind.deg)
            
        } catch {
            print(error)
        }
    }
    
}







