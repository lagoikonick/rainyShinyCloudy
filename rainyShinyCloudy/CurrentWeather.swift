//
//  CurrentWeather.swift
//  rainyShinyCloudy
//
//  Created by Nick on 02.06.17.
//  Copyright © 2017 Lagoiko Nick. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    
    var cityName: String {
        if _cityName == nil {
             _cityName = "NO DATA"
        }
        return _cityName
    }
    
    
    var date: String {
        if _date == nil {
            _date = "NO DATA"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = "NO DATA"
        }
        return _weatherType
    }

    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    
    
}
