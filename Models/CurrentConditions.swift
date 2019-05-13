//
//  CurrentConditions.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/9/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation

struct CurrentConditions {
    let name: String
    let cityId: Int
    let country: String
    private let currentTemp: Float
    let currentPressure: Int
    let currentHumidity: Int
    private let minTemp: Float
    private let maxTemp: Float
    let visibility: Int
    let windSpeed: Float
    let windDirection: Int?
    let sunrise: Int
    let sunset: Int
    
    //computed properties
    var currentTempFahrenheit: Float {
        get {
            return (self.currentTemp - 273.15) * (9/5) + 32
        }
    }
    var minTempFahrenheit: Float {
        get {
           return ((self.minTemp - 273.15) * (9/5) + 32)
        }
    }
    init(currentConditionsResponse: CurrentConditionsResponse){
        self.name = currentConditionsResponse.name
        self.cityId = currentConditionsResponse.sys.id
        self.country = currentConditionsResponse.sys.country
        self.currentTemp = currentConditionsResponse.main.temp
        self.currentPressure = currentConditionsResponse.main.pressure
        self.currentHumidity = currentConditionsResponse.main.humidity
        self.minTemp = currentConditionsResponse.main.temp_min
        self.maxTemp = currentConditionsResponse.main.temp_max
        self.visibility = currentConditionsResponse.visibility
        self.windSpeed = currentConditionsResponse.wind.speed
        self.windDirection = currentConditionsResponse.wind.deg
        self.sunrise = currentConditionsResponse.sys.sunrise
        self.sunset = currentConditionsResponse.sys.sunset
    }
}
