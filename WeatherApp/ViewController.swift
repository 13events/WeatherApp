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
    
    
    @IBOutlet weak var citySearchTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter(delegate:self)
        weather.getCurrentConditionsByCity(city: "Sacramento")
       
    }
    
    
    @IBAction func getWeatherForCityButtonPressed(_ sender: Any) {
    }
    
    //Mark: WeatherGetterDelegate Methods
    func didGetCurrentConditions(currentConditions: CurrentConditions) {
        print(currentConditions)
    }
    
    func didNotGetCurrentConditions(error: Error) {
        
    }
    


}

