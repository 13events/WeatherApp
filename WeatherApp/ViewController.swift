//
//  ViewController.swift
//  WeatherApp
//
//  Created by Jose Martinez on 5/4/19.
//  Copyright © 2019 Jose Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter()
        weather.getWeather(city: "Sacramento")
       
    }


}

