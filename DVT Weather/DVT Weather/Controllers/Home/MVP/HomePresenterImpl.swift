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
    
    func findCurrentWeather(lon: String, lat: String){
        
        
        homeRepo.fetchCurrentWeather(lon: lon, lat: lat, successHandler: { (weatherResponse) in
            //Run on main thread
            DispatchQueue.main.async {
                //Hide loading dialog
             //   self.loginView.hideLoading()
            }
        
            if weatherResponse != nil {
                self.homeView.setDataToView(model: weatherResponse)
                } else {
                    //Run on main Thread
                    DispatchQueue.main.async {
                      //  self.loginView.showAlert(message: "Unable to login, please try again.")
                    }
                }
                
          
            
        }) { (error) in
            //Run on main thread.
            DispatchQueue.main.async {
              //  self.loginView.hideLoading()
                self.homeView.showFailureAlert(with: error.localizedDescription)
            }
        }
        
    }
    
    func fetchForeCastWeather(lon: String, lat: String){
        
        
        homeRepo.fetchForeCastWeather(lon: lon, lat: lat, successHandler: { (weatherResponse) in
            //Run on main thread
            DispatchQueue.main.async {
                //Hide loading dialog
             //   self.loginView.hideLoading()
            }
        
            if let list = weatherResponse.list {
        
                self.homeView.setValueForForecast(foreCastList: list)
                    
                } else {
                    //Run on main Thread
                    DispatchQueue.main.async {
                      //  self.loginView.showAlert(message: "Unable to login, please try again.")
                    }
                }
                
          
            
        }) { (error) in
            //Run on main thread.
            DispatchQueue.main.async {
              //  self.loginView.hideLoading()
                self.homeView.showFailureAlert(with: error.localizedDescription)
            }
        }
        
    }
    
    func convertToDegree(value:Double) -> Int {
     let result =  Int(value - 273.15)
        return result
    }
    
 
    
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
