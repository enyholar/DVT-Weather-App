//
//  HomeRepositoryTest.swift
//  DVT WeatherTests
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import XCTest
@testable import DVT_Weather

class HomeRepositoryTest: XCTestCase {
    
    fileprivate var mockDVTService: DvtAPIService!
    //System Under Test (SUT)
    fileprivate var homeRepository: HomeRepository!
    
    fileprivate let testCoord = Coord(lat: 25.02, lon: -11.67)
    fileprivate var testCity: City {
        return City(id: 1, name: "Abuja", coord: testCoord, country: "Nigeria", population: 20000, timezone: 1245, sunrise: 44, sunset: 56)
    }
    fileprivate let testMain = Main(humidity: 12, temp_max: 29, temp_min: 12, temp: 34, pressure: 9, feels_like: 36)
    fileprivate let testWeather = Weather(icon: "https://www.icon.com/icon", id: 165781, description: "icon description", main: "main")
    fileprivate var testWeatherList: [Weather] {
        return [testWeather]
    }
    fileprivate let testClouds = Clouds(all: 500)
    fileprivate let testSys = Sys(type: 23, country: "Nigeria", sunset: 56, sunrise: 88, id: 1987)
    fileprivate let testWind = Wind(deg: 45, speed: 87.07)
    fileprivate var testList: List {
        return List(dt: 2936, main: testMain, weather: testWeatherList, clouds: testClouds, wind: testWind, sys: testSys, dt_txt: "dt txt")
    }
    fileprivate var testListArray: [List] {
        return [testList]
    }
    
//    fileprivate var testWeatherList: Weather {
//           return Weather(icon: "https://www.icon.com/icon", id: 165781, description: "icon description", main: "main")
//       }
//
//    fileprivate var testWeatherArray: [Weather] {
//           return [testWeatherList]
//       }
    
    fileprivate let testCod = "cod"
    fileprivate let testMessage = 2
    fileprivate let testCnt = 22
    fileprivate let testId = 9
    fileprivate let testCods = 3
    fileprivate let testName = "Abuja"
    fileprivate let testTimeZone = 4
    fileprivate let testVisibility = 6
    fileprivate let testDt = 68448
    fileprivate let testBase = "BaseStation"
    override func setUp() {
        mockDVTService = DvtAPIServiceMock(isError: false, coord: testCoord, city: testCity, list: testListArray, cod: testCod, message: testMessage, cnt: testCnt, main: testMain, id: testId, name: testName, timeZone: testTimeZone, sys: testSys, wind: testWind, visisbility: testVisibility, dt: testDt, base: testBase, weather: testWeatherList, cloud: testClouds, cods: testCods)
        homeRepository = HomeRepository(dvtAPIService: mockDVTService)
    }

 func test_fetchForeCastWeather_returnsForeCastData_whenSuccessfulRequestMade() {
        homeRepository.fetchForeCastWeather(lon: "6.05", lat: "88.90", successHandler: { forecastResponse in
            XCTAssert(forecastResponse.cnt == self.testCnt)
            XCTAssertTrue(forecastResponse.list?.count == self.testListArray.count)
            XCTAssertEqual(forecastResponse.list![0].dt, self.testListArray[0].dt)
        }) { _ in }
    }
    
    func test_fetchForecastWeather_returnsError_whenWrongRequestMade() {
        mockDVTService = DvtAPIServiceMock(isError: true, coord: testCoord, city: testCity, list: testListArray, cod: testCod, message: testMessage, cnt: testCnt, main: testMain, id: testId, name: testName, timeZone: testTimeZone, sys: testSys, wind: testWind, visisbility: testVisibility, dt: testDt, base: testBase, weather: testWeatherList, cloud: testClouds, cods: testCods)
        homeRepository.fetchForeCastWeather(lon: "", lat: "", successHandler: { _ in}) { error in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, "An error occurred.")
        }
    }
    
    func test_fetchCurrentWeather_returnsCurrentWeatherData_whenSuccessfulRequestMade() {
        homeRepository.fetchCurrentWeather(lon: "6.05", lat: "88.90", successHandler: { currentWeatherResponse in
            XCTAssert(currentWeatherResponse.dt == self.testDt)
            XCTAssertTrue(currentWeatherResponse.weather!.count == self.testWeatherList.count)
            XCTAssertEqual(currentWeatherResponse.weather![0].id, self.testWeatherList[0].id)
            
        }) { _ in }
    }
    
   func test_fetchCurrentWeather_returnsError_whenWrongRequestMade() {
        mockDVTService = DvtAPIServiceMock(isError: true, coord: testCoord, city: testCity, list: testListArray, cod: testCod, message: testMessage, cnt: testCnt, main: testMain, id: testId, name: testName, timeZone: testTimeZone, sys: testSys, wind: testWind, visisbility: testVisibility, dt: testDt, base: testBase, weather: testWeatherList, cloud: testClouds, cods: testCods)
        homeRepository.fetchCurrentWeather(lon: "", lat: "", successHandler: { _ in}) { error in
            XCTAssertNotNil(error)
            XCTAssertEqual(error.localizedDescription, "An error occurred.")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
