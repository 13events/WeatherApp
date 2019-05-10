//
//  Wind.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/5/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation
struct Wind: Decodable, CustomStringConvertible{
    
    let speed: Float
    let deg: Int
    
    var description: String {
        var description = ""
        
        description += "Wind Speed: \(self.speed) \n"
        description += "Wind Direction (Degs): \(self.deg) \n"
        
        return description
    }
}
