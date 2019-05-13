//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/4/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherGetterDelegate{
    func didGetCurrentConditions(currentConditions: CurrentConditions) {
        print(currentConditions)
    }
    
    func didNotGetCurrentConditions(error: Error) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter(delegate:self)
        weather.getCurrentConditionsByCity(city: "Sacramento")
       
    }


}

