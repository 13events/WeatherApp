//
//  WeatherGetter.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/4/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import Foundation

protocol WeatherGetterDelegate{
    func didGetWeather(weather: Weather)
}

class WeatherGetter {
    
    private let openWeatherMapBaseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let openWeatherMapAPIKey = "8aa7904807c0f3f104371126fc2978c1"
    
    func getWeather(city: String){
        
        //use the shared() URLSession for simple requests
        let session = URLSession.shared
        
        //create URL request string
        guard let weatherRequestURL = URL(string:"\(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)") else {print("Failed to create URL");
            print(" \(openWeatherMapBaseURL)?APPID=\(openWeatherMapAPIKey)&q=\(city)");return}
        
        //data task retrieves data
        let dataTask = session.dataTask(with: weatherRequestURL){data, response, error in
            if let error = error {
                //get an error when trying to get data from server
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                //received data
                do {
                    
                    let myCity = try JSONDecoder().decode(City.self, from: data)
                    print(myCity)
                    //print(myCity.coord)
                    //print(myCity.weather[0])
//                    guard let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
//                        print("Failed to extract json data into dictionary")
//                        return
//                    }
//
//                    //extract coordinates dictionary
//                    if let coordinates = jsonData["coord"] as? [String: Any]{
//                        print("Longitude: \(coordinates["lon"]!)")
//                        print("Latitude: \(coordinates["lat"]!)")
//                    }
//
//                    //extract weather dictionary
//                    if let weather = jsonData["weather"]![0]! as? [String: Any]{
//                        print("id: \(weather[0]["id"]!)")
//                        print("mian: \(weather[0]["main"]!)")
//                        print("description: \(weather[0]["description"]!)")
//                        print("icon: \(weather[0]["icon"]!)")
//                    }
                } catch let jsonError as NSError {
                    print("Error: \(jsonError)")
                }
            }
        }
        dataTask.resume()
    }
}
