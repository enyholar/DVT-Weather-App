//
//  ForecastDayTableViewCell.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//


import UIKit

class WeatherForecastDayTableViewCell: UITableViewCell {
    @IBOutlet var weatherConditionImageView: UIImageView!
    @IBOutlet var weekdayLabel: UILabel!
    @IBOutlet var weatherConditionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
