//
//  Day+Extension.swift
//  Weatheryy
//
//  Created by Matthew Singleton on 4/13/17.
//  Copyright © 2017 Matthew Singleton. All rights reserved.
//

import Foundation
import UIKit

extension Date {
  
  func dayOfTheWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: self)
    
  }
  
}
