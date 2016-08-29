//
//  ItemHourTableViewCell.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/28/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import UIKit

class ItemHourTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHour: UILabel!
    
    
    @IBOutlet weak var lblPercentPrecipitation: UILabel!
    
    @IBOutlet weak var lblIconWeather: UIImageView!
    
    @IBOutlet weak var lblTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
