//
//  FavoriteView.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
protocol FavoriteView: BaseView {
    func setValueForWeatherLocation(favoriteList : [CurrentWeatherResponse])
   
}
