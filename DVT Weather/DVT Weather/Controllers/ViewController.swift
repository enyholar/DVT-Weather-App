//
//  ViewController.swift
//  DVT Weather
//
//  Created by adex on 22/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
class ViewController: BaseViewController, CLLocationManagerDelegate{
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    lazy var presenter =  HomePresenterImpl(homeRepo: HomeRepository(dvtAPIService: AppConstants.DVT_API_SERVICE), homeView:self )
      
       override func getPresenter() -> BasePresenter {
              return presenter
          }
    
    let headers: HTTPHeaders = [
          .contentType("application/json"),
          .accept("application/json")
      ]
  let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLocationManager()
    }
    

    //TODO:Set up the location manager here.
    func setLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            
            self.locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : AppConstants.APP_ID]
            presenter.findCurrentWeather(lon: longitude, lat: latitude)
            presenter.fetchForeCastWeather(lon: longitude, lat: latitude)
        }
    }




}

extension ViewController: HomeView {
 
}

