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
        
            if let user = weatherResponse.clouds {
        
                
                    
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
        
            if let user = weatherResponse.city {
        
                
                    
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
