//
//  WeatherViewController.swift
//  Weatheryy
//
//  Created by Matthew Singleton on 4/13/17.
//  Copyright © 2017 Matthew Singleton. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
  
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var currentWeatherLabel: UILabel!
  @IBOutlet weak var currentTempLabel: UILabel!
  @IBOutlet weak var currentWeatherImageView: UIImageView!
  
  @IBOutlet weak var tableView: UITableView!
  
  var currentWeather: CurrentWeather!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    currentWeather = CurrentWeather()
    currentWeather.downloadWeatherDetails {
      self.updateMainUI()
    }
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func updateMainUI() {
    
    dateLabel.text = currentWeather.date
    currentTempLabel.text = "\(currentWeather.currentTemp)"
    currentWeatherLabel.text = currentWeather.weatherType
    locationLabel.text = currentWeather.cityName
    
    
    //    currentWeatherImageView.image = UIImage.init(named: currentWeather.weatherType)
    
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
    return 6
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
    
    return cell
    
  }
  
  
  
  
  
}
