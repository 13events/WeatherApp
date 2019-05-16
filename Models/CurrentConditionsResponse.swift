//
//  CurrentConditionsResponse.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/10/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation

struct CurrentConditionsResponse: Decodable{
    let name: String    //city name
    let dt: Int     //time weather data was aquired (linux time)
    let id: Int     //city ID
    let visibility: Int
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
    let sys: Sys
    
    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
    }
    
    struct Main: Decodable {
        let temp: Float
        let pressure: Int
        let humidity: Int
        let temp_min: Float
        let temp_max: Float
    }
    
    struct Wind: Decodable {
        let speed: Float
        let deg: Float?
    }
    
    struct Clouds: Decodable{
        let all: Int
    }
    
    struct Sys: Decodable{
        
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }
    
}
