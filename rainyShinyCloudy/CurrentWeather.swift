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
    var _currentTemp: Int!
    
    
    
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

    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                   
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                        
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let currentTempature = main["temp"] as? Double {
                        
                        let kalvinToCellsium = lround(currentTempature - 273.15)
                
                        self._currentTemp = kalvinToCellsium
                        
                        print(self.currentTemp)
                        
                    }
                }
                
                
                
                
                
            }
            completed()
        }
    }
}
