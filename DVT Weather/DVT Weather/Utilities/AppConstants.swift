//
//  AppConstants.swift
//  Ije
//
//  Created by adex on 02/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
import Cleanse

struct AppConstants {
    //MARK: - WFMMobileAPIService
       static let DVT_API_SERVICE: DvtAPIService = try! ComponentFactory.of(DvtAPIServiceComponent.self).build(())
    static let apiBaseUrl = "http://api.openweathermap.org/data/2.5/"

    static let baseImageUrl = "https://ijeapp.com/"
    static let CURRENT_WEATHER_PATH  = "\(apiBaseUrl)weather"
     static let REGISTER_PATH  = "\(apiBaseUrl)register"
     static let STATE_PATH  = "\(apiBaseUrl)fetchStates"
    static let CAR_BODY_PATH  = "\(apiBaseUrl)fetchCarTypesWithoutLimit"
     static let FIND_CAR_PATH  = "\(apiBaseUrl)fetchStates"
    static let USER_AUTH_HEADER_KEY = "userAuthHeader"
    static let APP_ID = "67baa261ccbfd6c99703333a6dc8a562"
    
}
