//
//  Constants.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/27/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import UIKit

public enum Degrees: String, CustomStringConvertible {
    
    case Celsius = "˚C"
    case Fahrenheit = "˚F"
    
    public var description: String {
        return rawValue
    }
}

public let PERCENT = "%"
public let KM = "km.h"
public let MM = "mm"
public let MIN = "min"
public let MAX = "max"
