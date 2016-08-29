//
//  User.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/27/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import Foundation

class User: NSObject {
    // declare lazy varialbe Nsuserdefaults
    private lazy var userDefault: NSUserDefaults = {
        return NSUserDefaults.standardUserDefaults()
    }()
    // set signleton Class
    static let sharedInstance = User()
    private override init() {
    }
    
    // SNS Token
    var SNSAccessToken: String? {
        get {
            return (userDefault.objectForKey("AccessToken") as? String)
        }
        set(token){
            userDefault.setObject(token, forKey: "AccessToken")
            userDefault.synchronize()
        }
    }
}