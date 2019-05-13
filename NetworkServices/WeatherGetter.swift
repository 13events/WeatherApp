//
//  WeatherGetter.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/4/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation

// WeatherGetter should be used by a class or struct and that class or struct
// should adobt this protocol and register itself as the delegate
// The delegates didGetWeather method is called if the weather data was
// acquired from openweathermap.org and successfully converted from JSON to
// a swift dictionary.
// The delegates didNotGetWeather methos is called if either:
// - The weather was not acquired from openweathermap.org, or
// - The received weather data could not be converted from JSON to a dictionary.
protocol WeatherGetterDelegate{
    func didGetCurrentConditions(currentConditions: CurrentConditions)
    func didNotGetCurrentConditions(error: Error)
}
// WeatherGetter
// =============
class WeatherGetter {
    
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "8aa7904807c0f3f104371126fc2978c1"
    private var delegate: WeatherGetterDelegate
    
    init(delegate: WeatherGetterDelegate){
        self.delegate = delegate
    }
    
    func getCurrentConditionsByCity(city: String){
        
        guard let weatherRequestURL = URL(string:"\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)") else
            { print("Failed to create URL"); return }
        getWeather(weatherRequestURL: weatherRequestURL)
        }
    
    private func getWeather(weatherRequestURL: URL){
        let session = URLSession.shared
        let dataTask = session.dataTask(with: weatherRequestURL){data, response, error in
            if let networkError = error {
                self.delegate.didNotGetCurrentConditions(error: networkError)
            } else if let data = data {
                //received data
                do {
                    //try to decode JSON
                    let weatherResponse = try JSONDecoder().decode(CurrentConditionsResponse.self, from: data)
                    
                    let weatherData = CurrentConditions(currentConditionsResponse: weatherResponse)
                    
                    self.delegate.didGetCurrentConditions(currentConditions: weatherData)
                } catch let jsonError as NSError {
                    self.delegate.didNotGetCurrentConditions(error: jsonError)
                }
            }
        }
        dataTask.resume()
        session.finishTasksAndInvalidate()
    }
}
