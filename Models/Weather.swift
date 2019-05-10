//
//  Weather.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/5/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation
struct Weather: Decodable, CustomStringConvertible {
    
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case weatherDescription = "description", id, main, icon
    }
    
    var description: String {
    
        var description = ""
        
        description += "City ID: \(self.id) \n"
        description += "Short weather description: \(self.main)\n"
        description += "detailed weather  description: \(self.weatherDescription)\n"
        description += "Icon: \(self.icon)\n"
        
        return description
    }
    
}
