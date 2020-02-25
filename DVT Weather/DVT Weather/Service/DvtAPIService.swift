//
//  YouthPartyAPIService.swift
//  DVT Weather
//
//  Created by adex on 23/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//
import Foundation
import Alamofire
import RxRetroSwift
import RxSwift
protocol DvtAPIService {
    
    func currentWeather(lon: String, lat: String,successHandler: @escaping (_ weatherResponse: CurrentWeatherResponse) -> Void, errorHandler: @escaping (_ error: Error) -> Void)
    
    func forecastWeather(lon: String, lat: String,successHandler: @escaping (_ forecastWeatherResponse: ForecastResponse) -> Void, errorHandler: @escaping (_ error: Error) -> Void)
    
}
