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
    
    var weather: Weather!
    
    @IBOutlet weak var cityNameLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setConstraintsForBackground()
        
        weather = Weather()
        
        weather.didCompleteDownload { 
            print("Did we get here")
            self.configureUI()
        }
        
    }
    
//    func setConstraintsForBackground() {
//        let box = UIImageView()
//        box.image = UIImage(named: "bg")
//        box.contentMode = UIViewContentMode.ScaleToFill
//        self.view.addSubview(box)
//        
//        box.snp_makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
//        
////        let labelView = UILabel()
////        labelView.text = weather.cityName
////        self.view.addSubview(labelView)
////        
////        labelView.snp_makeConstraints { (make) in
////            make.height.width.equalTo(50)
////            make.center
////        }
//    }
    
    func configureUI() {
        cityNameLbl.text = weather.cityName
    }
}

