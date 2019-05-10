//
//  City.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/5/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation

struct City: Decodable, CustomStringConvertible {
    let coord: Coordinate
    let weather: [Weather]
    let visibility: Float
    let name: String
    let wind: Wind
    

        
    
    var description: String {
        var description = ""
        
        description += "City: \(self.name)\n"
        description += "Current Conditions: \(self.weather[0].main), \(self.weather[0].weatherDescription)\n"
        description += "Wind Speed(meters/sec): \(self.wind.speed)\n"
        description += "Wind Direction(degrees): \(self.wind.deg)\n"
        description += "Visibility (miles): \(round(self.visibility / 1609.34))\n"
        
        return description
    }
}
