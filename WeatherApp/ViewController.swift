//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/4/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import UIKit


class ViewController: UIViewController, WeatherGetterDelegate{
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var highTemperatureLabel: UILabel!
    @IBOutlet weak var lowTemperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    //degree symbol
    let FAHRENHEIT = "°F"
    
    @IBOutlet weak var citySearchTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter(delegate:self)
        weather.getCurrentConditionsByCity(city: "Citrus+heights")
       
    }
    
    
    @IBAction func getWeatherForCityButtonPressed(_ sender: Any) {
    }
    
    //Mark: WeatherGetterDelegate Methods
    func didGetCurrentConditions(currentConditions: CurrentConditions) {
        
        DispatchQueue.main.async {
            self.cityNameLabel.text = currentConditions.name
            self.currentTemperatureLabel.text  = "\(String(currentConditions.currentTempFahrenheit)) \(self.FAHRENHEIT)"
            self.lowTemperatureLabel.text = "\(String(currentConditions.minTempFahrenheit)) \(self.FAHRENHEIT)"
            self.windSpeedLabel.text = "\(String(currentConditions.windSpeed)) m/s"
            self.visibilityLabel.text = "\(String(currentConditions.visibility)) meters"
            self.humidityLabel.text = "\(String(currentConditions.currentHumidity))%"
            self.pressureLabel.text = "\(String(currentConditions.currentPressure))hPa"
            self.sunriseLabel.text = "\(String(currentConditions.sunrise)) AM"
            self.sunsetLabel.text = "\(String(currentConditions.sunset)) PM"
        }
        
    }
    
    func didNotGetCurrentConditions(error: Error) {
        
    }
    


}

