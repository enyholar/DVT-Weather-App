//
//  DvtAPIServiceMock.swift
//  DVT WeatherTests
//
//  Created by Isaac Iniongun on 26/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
@testable import DVT_Weather

class DvtAPIServiceMock: DvtAPIService {
    
    let isError: Bool
    let coord: Coord
    let city: City
    let list: [List]
    let cod: String
    let message: Int
    let cnt: Int
    let main: Main
    let id: Int
    let name: String
    let timeZone: Int
    let sys: Sys
    let wind: Wind
    let visisbility: Int
    let dt: Int
    let base : String
    let weather: [Weather]
    let cloud: Clouds
    let cods: Int
    init(isError: Bool, coord: Coord, city: City, list: [List], cod: String, message: Int, cnt: Int,main:Main, id: Int,name: String,timeZone: Int,sys: Sys, wind: Wind,visisbility: Int,dt: Int, base : String,weather: [Weather],cloud: Clouds,cods: Int) {
        self.isError = isError
        self.coord = coord
        self.city = city
        self.list = list
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.main = main
        self.id = id
        self.name = name
        self.timeZone = timeZone
        self.sys = sys
        self.wind = wind
        self.visisbility = visisbility
        self.dt = dt
        self.base = base
        self.weather = weather
        self.cloud = cloud
        self.cods = cods
    }
    //    convenience init(<#parameters#>) {
    //        <#statements#>
    //    }
    
    func currentWeather(lon: String, lat: String, successHandler: @escaping (CurrentWeatherResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        if isError {
            errorHandler(TestError())
        } else {
            successHandler(CurrentWeatherResponse(id : id, main : main, name : name, timezone : timeZone, sys :sys, visibility : visisbility, wind : wind, dt : dt, base : base, weather : weather, cod : cods, clouds : cloud, coord : coord))
        }
    }
    
    func forecastWeather(lon: String, lat: String, successHandler: @escaping (ForecastResponse) -> Void, errorHandler: @escaping (Error) -> Void) {
        if isError {
            errorHandler(TestError())
        } else {
            successHandler(ForecastResponse(cod: cod, message: message, cnt: cnt, list: list, city: city))
        }
    }
    
    
}

class TestError: LocalizedError {
    var localizedDescription: String {
        return "An error occurred."
    }
}
