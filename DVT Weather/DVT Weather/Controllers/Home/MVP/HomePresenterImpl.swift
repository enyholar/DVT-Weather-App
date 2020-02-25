//
//  HomePresenterImpl.swift
//  DVT Weather
//
//  Created by adex on 23/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
struct HomePresenterImpl: BasePresenter {
    let homeRepo: HomeRepository
    let homeView: HomeView
    let pref = PreferenUtils()
    
    /**
    Implementing current weather based on the longitude and latiutude of the user location
    */
    func findCurrentWeather(lon: String, lat: String){
        
        
        homeRepo.fetchCurrentWeather(lon: lon, lat: lat, successHandler: { (weatherResponse) in
            //Run on main thread
            DispatchQueue.main.async {
                //Hide loading dialog
                //   self.loginView.hideLoading()
            }
            
            if weatherResponse != nil {
                self.pref.saveWeather(weather: weatherResponse)
                self.homeView.setDataToView(model: weatherResponse)
            
            } else {
                //Run on main Thread
                DispatchQueue.main.async {
                }
            }
            
            
            
        }) { (error) in
            //Run on main thread.
            DispatchQueue.main.async {
        
            }
        }
        
    }
    
    /**
      Fetching forecast weather the next 5 days based on user location
       */
    func fetchForeCastWeather(lon: String, lat: String){
        
        
        homeRepo.fetchForeCastWeather(lon: lon, lat: lat, successHandler: { (weatherResponse) in
            //Run on main thread
            DispatchQueue.main.async {
                //Hide loading dialog
                //   self.loginView.hideLoading()
            }
            
            if let list = weatherResponse.list {
                self.pref.saveWeatherforeCast(post: weatherResponse)
                self.homeView.setValueForForecast(foreCastList: list)
                
            } else {
                //Run on main Thread
                DispatchQueue.main.async {
                }
            }
            
            
            
        }) { (error) in
            //Run on main thread.
            DispatchQueue.main.async {
              
            }
        }
        
    }
    
    /**
         Fetching foffline saved data and set it to view for display, incase there is network failure
          */
    
    func getWeatherOfflineData(){
        let weatherForeCastData = pref.getWeatherforeCast()
        let weatherData = pref.getWeatherInfo()
        if weatherData != nil {
            self.homeView.setDataToView(model: weatherData!)
        }
        
        if weatherForeCastData != nil {
            self.homeView.setValueForForecast(foreCastList: weatherForeCastData!.list!)
        }
        
    }
    
    /**
     implementing favorite for particular location and storing data to Nuserdefault
          */
    
    func addFavoriteWeatherLocation(weatherInfo: CurrentWeatherResponse){
        var favoriteWeatherList :[CurrentWeatherResponse] = []
        let favoriList = pref.getFavoriteWeatherLocation()
        if favoriList != nil {
            favoriteWeatherList = pref.getFavoriteWeatherLocation()!.favouriteWeather!
            favoriteWeatherList.append(weatherInfo)
            let weather = FavoriteWeatherLocation.init( ver: favoriteWeatherList)
            pref.saveFavoriteWeatherLocation(model: weather)
        }else{
            favoriteWeatherList.append(weatherInfo)
            let weather = FavoriteWeatherLocation.init( ver: favoriteWeatherList)
            pref.saveFavoriteWeatherLocation(model: weather)
            
        }
        
        self.homeView.showAlert(message: "Weather location save successfully")
        
    }
    
    /**
         Covert faherenhit to degree celcius
          */
    func convertToDegree(value:Double) -> Int {
        let result =  Int(value - 273.15)
        return result
    }
    
    /**
         converting number to day of the week for better user experience
           */
    
    func getDayOfWeek(fromDate: Double) -> String {
        let date = Date(timeIntervalSince1970: fromDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeekString = dateFormatter.string(from: date)
        
        return dayOfWeekString
    }
    
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func viewWillDisappear() {
        
    }
    
    func viewDidDisappear() {
        
    }
    
    
    
}
