//
//  FavouriteViewController.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import UIKit

class FavouriteViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {
    lazy var presenter = FavoritePresenter(favoriteView: self)
    @IBOutlet weak var favouriteLocationTableView: UITableView!
    
    var favoriteWeatherLocationList :[CurrentWeatherResponse] = []
    
    
    override func getPresenter() -> BasePresenter {
         return presenter
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favouriteLocationTableView.estimatedRowHeight = 100
        favouriteLocationTableView.rowHeight = UITableView.automaticDimension
        
        favouriteLocationTableView.separatorStyle = .none
        favouriteLocationTableView.dataSource = self
        favouriteLocationTableView.delegate = self
        
        presenter.addFavoriteWeatherLocation()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteWeatherLocationList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.favoriteWeatherLocationList[indexPath.row]
        
        // Dequeue Reusable Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.FAVORITE_CELL_SEGUE_ID, for: indexPath) as! FavoriteWeatherLocationTableViewCell
        
        // Configure Cell
        let weather = model.weather![0]
        let weatherIcon = WeatherIcon(iconString: weather.icon!)
        cell.weatherIcon.image = weatherIcon.image
        cell.weatherCitylbl.text = model.name
        cell.lblLastUpdatedWeatherDegree.text = "\(presenter.convertToDegree(value: (model.main?.temp)!))°"
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let favorite = favoriteWeatherLocationList[indexPath.row]
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let controller = storyboard.instantiateViewController(withIdentifier: "favoriteDetailVc") as! FavoriteDetailViewController
        controller.lat = favorite.coord?.lat?.string ?? ""
        controller.lon = favorite.coord?.lon?.string ?? ""
         self.navigationController?.pushViewController(controller, animated: true)
     }
    
    
    
}

extension FavouriteViewController: FavoriteView {
    func setValueForWeatherLocation(favoriteList: [CurrentWeatherResponse]) {
        favoriteWeatherLocationList = favoriteList
        favouriteLocationTableView.reloadData()
    }
    
    
    
}
