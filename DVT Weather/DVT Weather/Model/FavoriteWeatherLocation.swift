//
//  FavoriteWeatherLocation.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
struct FavoriteWeatherLocation : Codable {
    
    let favouriteWeather : [CurrentWeatherResponse]?

    init(ver:[CurrentWeatherResponse]?) {
        favouriteWeather = ver
    }

}
