//
//  HomeRepositoryTest.swift
//  DVT WeatherTests
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import XCTest

class HomeRepositoryTest: XCTestCase {
    func testGetMoviesWithExpectedURLHostAndPath() {
     let homeRepo = HomeRepository(dvtAPIService: AppConstants.DVT_API_SERVICE)
        homeRepo.fetchCurrentWeather()
     }

    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
