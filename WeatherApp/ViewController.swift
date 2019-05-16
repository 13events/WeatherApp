//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/4/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import UIKit


class ViewController: UIViewController, WeatherGetterDelegate, UITextFieldDelegate{
    
    //degree symbol
    let FAHRENHEIT = "°F"
    
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
    @IBOutlet weak var cloudCoverLabel: UILabel!

    @IBOutlet weak var citySearchTextField: UITextField!
    var weather: WeatherGetter!

    override func viewDidLoad() {
        super.viewDidLoad()
        citySearchTextField.delegate = self
        weather = WeatherGetter(delegate:self)
        weather.getCurrentConditionsByCity(city: "Citrus+heights")
       
    }
    
    //Search and retrieve weather conditons
    @IBAction func getWeatherForCityButtonPressed(_ sender: Any) {
        
        //get search term
        guard var searchTerm = citySearchTextField.text else {
            print("Failed to get text from search field")
            return
        }
        
        //replace spaces with '+'
        searchTerm = searchTerm.replacingOccurrences(of: " ", with: "+")
        
        //debug print string
        print(searchTerm)
        
        //call getCurrentConditionsByCity()
        weather.getCurrentConditionsByCity(city: searchTerm)
        
        
       
    }
    
    //Mark: WeatherGetterDelegate Methods
    func didGetCurrentConditions(currentConditions: CurrentConditions) {
        
        DispatchQueue.main.async {
            
            //TODO: Factor this code out perhaps?
            self.cityNameLabel.text = currentConditions.name
            self.currentTemperatureLabel.text  = "\(String(currentConditions.currentTempFahrenheit)) \(self.FAHRENHEIT)"
            self.lowTemperatureLabel.text = "\(String(currentConditions.minTempFahrenheit)) \(self.FAHRENHEIT)"
            self.windSpeedLabel.text = "\(String(currentConditions.windSpeed)) m/s"
            self.visibilityLabel.text = "\(String(currentConditions.visibility)) meters"
            self.humidityLabel.text = "\(String(currentConditions.currentHumidity))%"
            self.pressureLabel.text = "\(String(currentConditions.currentPressure))hPa"
            self.sunriseLabel.text = "\(String(currentConditions.sunrise)) AM"
            self.sunsetLabel.text = "\(String(currentConditions.sunset)) PM"
            self.weatherConditionLabel.text = currentConditions.weatherDescription
            self.cloudCoverLabel.text = "\(currentConditions.cloudCover)%"
        }
        
    }
    
    //Handle error, throw UIAlert
    func didNotGetCurrentConditions(error: Error) {
        
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "City Not Found", message: "We were unable to find the city or there was a problem reaching the server.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
       
        //for debugging
        print(error)
    }
    
    //Mark: UITextFieldDelegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    //Dismiss keyboard when screen is touched
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

