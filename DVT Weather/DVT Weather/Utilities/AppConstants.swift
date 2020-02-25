//
//  AppConstants.swift
// Dvt Weather
//
//  Created by adex on 02/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
import Cleanse

struct AppConstants {
    //MARK: - DVTAPIService
       static let DVT_API_SERVICE: DvtAPIService = try! ComponentFactory.of(DvtAPIServiceComponent.self).build(())
    static let apiBaseUrl = "http://api.openweathermap.org/data/2.5/"
    static let CURRENT_WEATHER_PATH  = "\(apiBaseUrl)weather"
    static let USER_AUTH_HEADER_KEY = "userAuthHeader"
    static let APP_ID = "67baa261ccbfd6c99703333a6dc8a562"
    static let METRICS = "metrics"
    static let FORECAST_CELL_SEGUE_ID = "ForecastCell"
    static let FAVORITE_CELL_SEGUE_ID = "FavoriteCell"
    
}
