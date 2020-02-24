//
//  YouthPartyAPIService.swift
//  Youth Party
//
//  Created by adex on 30/01/2020.
//  Copyright © 2020 adex. All rights reserved.
//

import Foundation
import Alamofire
import RxRetroSwift
import RxSwift
protocol DvtAPIService {
    
    func currentWeather(lon: String, lat: String,successHandler: @escaping (_ weatherResponse: CurrentWeatherResponse) -> Void, errorHandler: @escaping (_ error: Error) -> Void)
    
    func forecastWeather(lon: String, lat: String,successHandler: @escaping (_ forecastWeatherResponse: ForecastResponse) -> Void, errorHandler: @escaping (_ error: Error) -> Void)
    
}
