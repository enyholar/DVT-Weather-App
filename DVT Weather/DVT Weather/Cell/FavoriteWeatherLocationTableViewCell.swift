//
//  FavoriteWeatherLocationTableViewCell.swift
//  DVT Weather
//
//  Created by adex on 25/02/2020.
//  Copyright © 2020 Gideon Oyediran. All rights reserved.
//

import UIKit

class FavoriteWeatherLocationTableViewCell: UITableViewCell {
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherCitylbl: UILabel!
    
    @IBOutlet weak var lblLastUpdatedWeatherDegree: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
