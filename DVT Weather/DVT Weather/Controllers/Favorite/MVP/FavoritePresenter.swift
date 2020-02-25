//
//  FavoritePresenter.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
struct FavoritePresenter: BasePresenter {
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
    
    let favoriteView: FavoriteView
    let pref = PreferenUtils()
    
    /**
         Retrieve stored favorite weather location data
           */
    func addFavoriteWeatherLocation(){
        var favoriteWeatherList :[CurrentWeatherResponse] = []
        let favoriList = pref.getFavoriteWeatherLocation()
        if favoriList != nil {
            favoriteWeatherList = pref.getFavoriteWeatherLocation()!.favouriteWeather!
            favoriteView.setValueForWeatherLocation(favoriteList: favoriteWeatherList)
        }
        
    }
    func convertToDegree(value:Double) -> Int {
        let result =  Int(value - 273.15)
        return result
    }
    
    
}
