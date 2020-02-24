//
//  HomeView.swift
//  DVT Weather
//
//  Created by adex on 23/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import Foundation
protocol HomeView: BaseView {
    func setDataToView(model:CurrentWeatherResponse)
    func setValueForForecast(foreCastList : [List])
   
}
