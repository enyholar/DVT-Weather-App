//
//  WeatherColor.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
import UIKit

enum WeatherColor {
    case clearSky
    case fewClouds
    case scatteredClouds
    case brokenClouds
    case showerRain
    case rain
    case thunderstorm
    case snow
    case mist
    case clearSkyNight
    case fewCloudsNight
    case scatteredCloudsNight
    case brokenCloudsNight
    case showerRainNight
    case rainNight
    case thunderstormNight
    case snowNight
    case mistNight
    case `default`
    
    init(iconString: String) {
        switch iconString {
        case "01d": self = .clearSky
        case "02d": self = .fewClouds
        case "03d": self = .scatteredClouds
        case "04d": self = .brokenClouds
        case "09d": self = .showerRain
        case "10d": self = .rain
        case "11d": self = .thunderstorm
        case "13d": self = .snow
        case "50d": self = .mist
        case "01n": self = .clearSkyNight
        case "02n": self = .fewCloudsNight
        case "03n": self = .scatteredCloudsNight
        case "04n": self = .brokenCloudsNight
        case "09n": self = .showerRainNight
        case "10n": self = .rainNight
        case "11n": self = .thunderstormNight
        case "13n": self = .snowNight
        case "50n": self = .mistNight
        default: self = .default
        }
    }
}

extension WeatherColor {
    var backgroundColorForView: UIColor {
        switch self {
        case .clearSky: return UIColor(hexString: "#47AB2F")
        case .fewClouds:  return UIColor(hexString: "#54717A")
        case .scatteredClouds:return UIColor(hexString: "#54717A")
        case .brokenClouds: return UIColor(hexString: "#54717A")
        case .showerRain: return UIColor(hexString: "#57575D")
        case .rain:  return UIColor(hexString: "#57575D")
        case .thunderstorm: return UIColor(hexString: "#57575D")
        case .snow:  return UIColor(hexString: "#54717A")
        case .mist: return UIColor(hexString: "#54717A")
        case .clearSkyNight: return UIColor(hexString: "#47AB2F")
        case .fewCloudsNight: return UIColor(hexString: "#54717A")
        case .scatteredCloudsNight: return UIColor(hexString: "#54717A")
        case .brokenCloudsNight:return UIColor(hexString: "#54717A")
        case .showerRainNight: return UIColor(hexString: "#57575D")
        case .rainNight: return UIColor(hexString: "#57575D")
        case .thunderstormNight: return UIColor(hexString: "#54717A")
        case .snowNight:return UIColor(hexString: "#54717A")
        case .mistNight:return UIColor(hexString: "#54717A")
        case .default: return UIColor(hexString: "#47AB2F3")
        }
    }
    
}
