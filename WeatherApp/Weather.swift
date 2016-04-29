//
//  Weather.swift
//  WeatherApp
//
//  Created by Matthew Bracamonte on 4/16/16.
//  Copyright © 2016 Matthew Bracamonte. All rights reserved.
//

import Foundation
import Alamofire

class Weather {
    
    private var _cityName: String!
    private var _cityCountry: String!
    private var _weatherDescription: String!
    private var _windSpeed: String!
    private var _humidity: String!
    private var _tempMin: String!
    private var _tempMax: String!
    private var _apiURL: String!
    private var _currentTemp:String!
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    var tempMin: String! {
        if _tempMin == nil {
            _tempMin = ""
        }
        return _tempMin
    }
    
    var tempMax: String {
        if _tempMax == nil {
            _tempMax = ""
        }
        return _tempMax
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var cityCountry: String {
        if _cityCountry == nil {
            _cityCountry = ""
        }
        return _cityCountry
    }
    
    var weatherDescription: String {
        if _weatherDescription == nil {
            _weatherDescription = ""
        }
        return _weatherDescription
    }
    
    var windSpeed: String {
        if _windSpeed == nil {
            _windSpeed = ""
        }
        return _windSpeed
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
        }
        return _humidity
    }
    
    
    init() {
        self._apiURL = "\(URL_WEATHER)"
    }
    
    func didCompleteDownload(completed: DownloadComplete) {
        let url = NSURL(string: self._apiURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(result.value.debugDescription)
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let cityName = dict["name"] as? String {
                    self._cityName = cityName
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let description = weather[0]["description"] as? String {
                        self._weatherDescription = description
                        print(self._weatherDescription.capitalizedString)
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject>  {
                    if let temp = main["temp"] as? Int {
                        self._currentTemp = "\(temp)"
                        print(self._currentTemp)
                    }
                    if let tempMin = main["temp_min"] as? Double {
                        self._tempMin = "\(tempMin)"
                        print(self._tempMin)
                    }
                    if let tempMax = main["temp_max"] as? Double {
                        self._tempMax = "\(tempMax)"
                        print(self._tempMax)
                    }
                    if let humidity = main["humidity"] as? Int {
                        self._humidity = "\(humidity)%"
                        print(self._humidity)
                    }
                }
                if let wind = dict["wind"] as? Dictionary<String,AnyObject> {
                    if let windSpeed = wind["speed"] as? Int {
                        self._windSpeed = "\(windSpeed)mph"
                        print(self._windSpeed)
                    }
                }
                if let sys = dict["sys"] as? Dictionary<String,AnyObject> {
                    if let country = sys["country"] as? String {
                        self._cityCountry = country
                    }
                }
                completed()
            }
        }
    }
}





















