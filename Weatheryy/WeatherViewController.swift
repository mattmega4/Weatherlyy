//
//  WeatherViewController.swift
//  Weatheryy
//
//  Created by Matthew Singleton on 4/13/17.
//  Copyright © 2017 Matthew Singleton. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController {
  
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentWeatherLabel: UILabel!
  @IBOutlet weak var currentTempLabel: UILabel!
  @IBOutlet weak var currentWeatherImageView: UIImageView!
  
  @IBOutlet weak var tableView: UITableView!
  
  var currentWeather: CurrentWeather!
  var forecast: Forecast!
  var forecasts = [Forecast]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    currentWeather = CurrentWeather()
    
    currentWeather.downloadWeatherDetails {
      self.downloadForecastData {
        self.updateMainUI()
      }
      
    }
  }
  
  func updateMainUI() {
    
    dateLabel.text = currentWeather.date
    currentTempLabel.text = "\(currentWeather.currentTemp)º"
    currentWeatherLabel.text = currentWeather.weatherType
    locationLabel.text = currentWeather.cityName
    currentWeatherImageView.image = UIImage.init(named: currentWeather.weatherType)
    
  }
  
  
  func downloadForecastData(completed: @escaping DownloadComplete) {
    
    let forecastURL = URL(string: FORECAST_URL)!
    
    Alamofire.request(forecastURL).responseJSON { response in
      
      let result = response.result
      
      if let dict = result.value as? Dictionary<String, AnyObject> {
        
        if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
          
          for obj in list {
            
            let forecast = Forecast(weatherDict: obj)
            self.forecasts.append(forecast)
            print(obj)
          }
          self.forecasts.remove(at: 0)
          self.tableView.reloadData()
        }
      }
      completed()
    }
  }
  
  
  
  
} // End of Class


extension WeatherViewController: UITableViewDelegate {
  // Did Select
}

extension WeatherViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return forecasts.count
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell {
      
      let forecast = forecasts[indexPath.row]
      cell.configureCell(forecast: forecast)
      return cell
      
    } else {
      return WeatherTableViewCell()
    }
    
  }
  
  
  
  
  
}
