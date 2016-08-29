//
//  ItemWeatherTableViewCell.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/24/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ItemWeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblLowestTemperature: UILabel!
    
    @IBOutlet weak var lblHighestTemperature: UILabel!
    
    @IBOutlet weak var lblPrecipitation: UILabel!
    
    @IBOutlet weak var lblWindy: UILabel!
    
    @IBOutlet weak var lblHumidity: UILabel!
    
    @IBOutlet weak var vCover: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayData(dataPoint: DataPoint){
        if let minTemperature = dataPoint.temperatureMin{
            lblLowestTemperature.text = MIN + " " + String(round(minTemperature)) + "˚C"
        }
        if let maxTemperature = dataPoint.temperatureMax{
            lblHighestTemperature.text = MAX + " " + String(round(maxTemperature)) + "˚C"
        }
        // fa-tint
        let precipIcon = String.fontAwesomeIconWithName(FontAwesome.Tint)
        lblPrecipitation.font = UIFont.fontAwesomeOfSize(11)
        if let precipi = dataPoint.precipType?.rawValue {
            let intensity = dataPoint.precipIntensity ?? 0.0
            let percent = dataPoint.precipProbability ?? 0
            let strPrecipi = precipIcon + " " + precipi + " " + String(intensity.roundToPlaces(2)) + MM + ", " + String(Int(round(percent * 100))) + PERCENT
            lblPrecipitation.text = strPrecipi
        }else {
            lblPrecipitation.text = precipIcon + " 0.0 mm, 0%"
        }
        
        let windSpeed = dataPoint.windSpeed ?? 0
        lblWindy.text = String(windSpeed.roundToPlaces(2)) + KM
        
        lblHumidity.text = String(Int(dataPoint.humidity! * 100)) + PERCENT
    }
    
}
