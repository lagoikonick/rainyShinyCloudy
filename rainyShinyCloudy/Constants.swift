//
//  Constants.swift
//  rainyShinyCloudy
//
//  Created by Nick on 02.06.17.
//  Copyright © 2017 Lagoiko Nick. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "b1f83411da552eb096c72f7c979e83a3"


typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"
