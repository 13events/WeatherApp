//
//  Coordinates.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/5/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation

struct Coordinate: Decodable, CustomStringConvertible {
    let lon: Float?
    let lat: Float?
    
    var description: String {
        
        if  let longitude = lon,
            let latitude = lat {
            
        return "longitude: \(longitude), latitude \(latitude)\n"
            
        } else {
            
            return "Failed to get coordinate description"
            
        }
        
    }
    
}
