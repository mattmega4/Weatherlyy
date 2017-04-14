//
//  WeatherTableViewCell.swift
//  Weatheryy
//
//  Created by Matthew Singleton on 4/14/17.
//  Copyright © 2017 Matthew Singleton. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

  @IBOutlet weak var weatherIconImageView: UIImageView!
  @IBOutlet weak var dayLabel: UILabel!
  @IBOutlet weak var lowAndHighLabel: UILabel!
  @IBOutlet weak var weatherTypeLabel: UILabel!
  
  
  
  func configureCell(forecast: Forecast) {
    
    lowAndHighLabel.text = "\(forecast.lowTemp) / \(forecast.highTemp)"
    weatherTypeLabel.text = forecast.weatherType
    dayLabel.text = forecast.date
    weatherIconImageView.image = UIImage.init(named: forecast.weatherType)
    
    
    
  }



}
