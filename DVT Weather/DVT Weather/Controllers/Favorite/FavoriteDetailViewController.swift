//
//  FavoriteDetailViewController.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
class FavoriteDetailViewController: BaseViewController, CLLocationManagerDelegate,UITableViewDelegate, UITableViewDataSource{
    var lat = ""
    var lon = ""
  var weatherForecastList :[List] = []
        
        lazy var presenter =  HomePresenterImpl(homeRepo: HomeRepository(dvtAPIService: AppConstants.DVT_API_SERVICE), homeView:self )
        
        override func getPresenter() -> BasePresenter {
            return presenter
        }
        let locationManager = CLLocationManager()
        
        @IBOutlet weak var stateNameLbl: UILabel!
        @IBOutlet weak var weatherTableView: UITableView!
        @IBOutlet weak var lblMinDegree: UILabel!
        @IBOutlet weak var lblMaxTempDegree: UILabel!
        @IBOutlet weak var lblCurrentTemp: UILabel!
        @IBOutlet weak var lblTempDegree: UILabel!
        @IBOutlet weak var lblWeatherCondition: UILabel!
        @IBOutlet weak var weatherBackgroundImage: UIImageView!
        
        @IBOutlet var weatherView: UIView!
        override func viewDidLoad() {
            super.viewDidLoad()
            weatherTableView.estimatedRowHeight = 100
            weatherTableView.rowHeight = UITableView.automaticDimension
            
            weatherTableView.separatorStyle = .none
            weatherTableView.dataSource = self
            weatherTableView.delegate = self
    
            getWeatherDataInformation()
        }
    

    func getWeatherDataInformation() {
        presenter.findCurrentWeather(lon: lon, lat: lat)
        presenter.fetchForeCastWeather(lon: lon, lat: lat)
    }

        
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return weatherForecastList.count
        }
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let model = self.weatherForecastList[indexPath.row]
            
            // Dequeue Reusable Cell
            let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.FORECAST_CELL_SEGUE_ID, for: indexPath) as! WeatherForecastDayTableViewCell
            
            // Configure Cell
            let weather = model.weather![0]
            let weatherIcon = WeatherIcon(iconString: weather.icon!)
            cell.weatherConditionImageView.image = weatherIcon.image
            cell.weekdayLabel.text = presenter.getDayOfWeek(fromDate: Double(model.dt!))
            cell.weatherConditionLabel.text = weather.description
            cell.temperatureLabel.text = "\(presenter.convertToDegree(value: (model.main?.temp)!))°"
            cell.backgroundColor = UIColor.clear
            // print (model.weekday)
            
            return cell
        }
        
        
        
    }

    extension FavoriteDetailViewController: HomeView {
        func setValueForForecast(foreCastList: [List]) {
            weatherForecastList = foreCastList
            weatherTableView.reloadData()
        }
        
        func setDataToView(model: CurrentWeatherResponse) {
            stateNameLbl.text = model.name
            lblTempDegree.text = "\(presenter.convertToDegree(value: (model.main?.temp)!))°"
            lblMinDegree.text = "\(presenter.convertToDegree(value: (model.main?.temp_min)!))°"
            lblCurrentTemp.text = "\(presenter.convertToDegree(value: (model.main?.temp)!))°"
            lblMaxTempDegree.text = "\(presenter.convertToDegree(value: (model.main?.temp_max)!))°"
            let weather = model.weather![0]
            lblWeatherCondition.text = weather.main
            let weatherIcon = WeatherIcon(iconString: weather.icon!)
             let weatherColor = WeatherColor(iconString: weather.icon!)
            weatherBackgroundImage.image = weatherIcon.backgroundImage
            self.weatherView.backgroundColor = weatherColor.backgroundColorForView
            self.weatherTableView.backgroundColor = weatherColor.backgroundColorForView
            
        }
        
        
    }
