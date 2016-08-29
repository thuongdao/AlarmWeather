//
//  TodayViewController.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/24/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import UIKit

class TodayViewController: AWBaseViewController {
    
    let ItemHourIdentify = "ItemHour"
    private let kHeightCollection: CGFloat = 152
    
    @IBOutlet weak var imgCover: UIImageView!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblCurrentTemperature: UILabel!
    
    @IBOutlet weak var lblWeatherOverview: UILabel!
    
    @IBOutlet weak var vOverView: UIView!
    
    @IBOutlet weak var contentTableView: UITableView!
    
    var headerView: ItemWeatherTableViewCell!
    var current: DataPoint?
    var hourlyData = [DataPoint]()
    var hourCollectionVC: WeatherByHoursCollectionVC!
    var daily = [DataPoint]()
    
    override func loadView() {
        super.loadView()
    }
    
    func setGradientCoverView(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = vOverView.bounds
        gradientLayer.colors = [UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor, UIColor.blackColor().colorWithAlphaComponent(0.4).CGColor, UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        vOverView.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTableView.registerNib(UINib(nibName: "ItemHourTableViewCell", bundle: NSBundle.mainBundle()),
                                     forCellReuseIdentifier: ItemHourIdentify)
        contentTableView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.1)
        
        headerView = ItemWeatherTableViewCell.loadFromNibNamed("ItemWeatherTableViewCell") as! ItemWeatherTableViewCell
        
        setGradientCoverView()

        requestData()
    }
    
    func requestData(){
        let client = APIClient(apiKey: API_KEY)
        client.units = .CA
        client.language = .English
        client.getForecast(latitude: 35.652832, longitude: 139.839478, excludeForecastFields: [.Alerts, .Flags, .Minutely]) { [weak self](forecast, error) in
            if error == nil{
                if let _hourlyData = forecast?.hourly?.data {
                    self?.hourlyData = _hourlyData
                }
                if let _daily = forecast?.daily?.data{
                    self?.daily = _daily
                }
                if let location = forecast?.timezone{
                    self!.lblLocation.text = location
                }
                self?.displayData()
            }
        }
    }
    
    func displayData(){
        headerView.displayData(daily[0])
        headerView.setNeedsDisplay()
        self.view.setNeedsDisplay()
        contentTableView.reloadData()
    }
}

extension TodayViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourlyData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ItemHourIdentify) as! ItemHourTableViewCell
        cell.selectionStyle = .None
        cell.backgroundColor = UIColor.clearColor()
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.backgroundColor = UIColor.clearColor()
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
}
