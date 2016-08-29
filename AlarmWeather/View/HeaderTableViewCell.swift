//
//  HeaderTableViewCell.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/24/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imgWeather: UIImageView!
    
    @IBOutlet weak var lblDegree: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
