//
//  HomeRepository.swift
//  DVT Weather
//
//  Created by adex on 23/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
import RxSwift
  import RxRetroSwift
  struct HomeRepository {
    let dvtAPIService: DvtAPIService
    
    func fetchCurrentWeather( lon: String,lat: String, successHandler: @escaping (CurrentWeatherResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        return dvtAPIService.currentWeather(lon: lon, lat: lat, successHandler: successHandler, errorHandler: errorHandler)
      }

    
    func fetchForeCastWeather( lon: String,lat: String, successHandler: @escaping (ForecastResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        return dvtAPIService.forecastWeather(lon: lon, lat: lat,  successHandler: successHandler, errorHandler: errorHandler)
      }

}
