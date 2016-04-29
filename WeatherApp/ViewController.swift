//
//  ViewController.swift
//  WeatherApp
//
//  Created by Matthew Bracamonte on 4/16/16.
//  Copyright © 2016 Matthew Bracamonte. All rights reserved.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var windmphLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
  
    let weather = Weather()
    
    @IBOutlet weak var cityNameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setConstraintsForBackground()
        
        bgImageView.image = UIImage(named: "chicagobg")
        
        weather.didCompleteDownload { 
            print("Did we get here")
            self.configureUI()
        }
        
    }
    
    func configureUI() {
        cityNameLbl.text = weather.cityName
        weatherDescription.text = weather.weatherDescription.capitalizedString
        currentTemperature.text = "Current Temperatue: \(weather.currentTemp)\u{00B0}"
        humidityLbl.text = "Humidty: \(weather.humidity)"
        windmphLbl.text = "Wind Speed: \(weather.windSpeed)"
    }
}

