//
//  Constants.swift
//  Weatheryy
//
//  Created by Matthew Singleton on 4/13/17.
//  Copyright © 2017 Matthew Singleton. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "dde8e35a52116757c14ddf5b907ec33e"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)37.7749\(LONGITUDE)-122.4194\(APP_ID)\(API_KEY)"




