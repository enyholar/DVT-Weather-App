//
//  PreferenUtils.swift
//  MyrideRider
//
//  Created by adex on 30/09/2019.
//  Copyright © 2019 adex. All rights reserved.
//

import Foundation
class PreferenUtils {
    let userKey = "user"
    let weatherKey = "weatherKey"
    let forecastResponseKey = "ForecastResponseKey"
    let favoriteLocationKey = "favoriteLocationKey"
    let prefToken = "prefToken"
    
    func saveWeather(weather: CurrentWeatherResponse)  {
        let defaults = UserDefaults.standard
        // Use PropertyListEncoder to convert Player into Data / NSData
        defaults.set(try? PropertyListEncoder().encode(weather), forKey: weatherKey)
        
    }
    
    func getWeatherInfo() -> CurrentWeatherResponse? {
        let defaults = UserDefaults.standard
        let weatherData = defaults.object(forKey: weatherKey) as? Data ?? Data()
        let data = try? PropertyListDecoder().decode(CurrentWeatherResponse.self, from: weatherData)
        return data
    }
    
    //    func logOut()  {
    //        let defaults = UserDefaults.standard
    //        defaults.removeObject(forKey: cardOptionKey)
    //
    //    }
    
    func saveWeatherforeCast(post: ForecastResponse)  {
        let defaults = UserDefaults.standard
        // Use PropertyListEncoder to convert Player into Data / NSData
        defaults.set(try? PropertyListEncoder().encode(post), forKey: forecastResponseKey)
        
    }
    
    func getWeatherforeCast() -> ForecastResponse? {
        let defaults = UserDefaults.standard
        let forecastData = defaults.object(forKey: forecastResponseKey) as? Data ?? Data()
        let data = try? PropertyListDecoder().decode(ForecastResponse.self, from: forecastData)
        return data
    }
    
    func saveFavoriteWeatherLocation(model: FavoriteWeatherLocation )  {
        let defaults = UserDefaults.standard
        // Use PropertyListEncoder to convert Player into Data / NSData
        defaults.set(try? PropertyListEncoder().encode(model), forKey: favoriteLocationKey)
    }
    
    func getFavoriteWeatherLocation() ->FavoriteWeatherLocation? {
        let defaults = UserDefaults.standard
        let forecastData = defaults.object(forKey: favoriteLocationKey) as? Data ?? Data()
        let data = try? PropertyListDecoder().decode(FavoriteWeatherLocation.self, from: forecastData)
        return data
    }
    

}
