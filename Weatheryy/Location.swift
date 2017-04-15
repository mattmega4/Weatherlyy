//
//  Location.swift
//  Weatheryy
//
//  Created by Matthew Singleton on 4/14/17.
//  Copyright © 2017 Matthew Singleton. All rights reserved.
//

import CoreLocation


class Location {
  
  static var sharedInstance = Location()
  private init() {}
  
  var latitude: Double!
  var longitutde: Double!
  
}
