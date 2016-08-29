//
//  Extension.swift
//  AlarmWeather
//
//  Created by ThuongDV on 8/27/16.
//  Copyright © 2016 Dao Van Thuong. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    func copyView() -> AnyObject
    {
        return NSKeyedUnarchiver.unarchiveObjectWithData(NSKeyedArchiver.archivedDataWithRootObject(self))!
    }
    
    func showErrorWithCode(errorCode : Int, handle:(()-> Void)?){
//        var message = ""
//        if errorCode < -5000{
//            message = "Returned Data error"
//        }else if errorCode < -2000{
//            message =  "Server is busy"
//        }else if errorCode < 0{
//            message = ERROR_MESSAGE.unavailableNetWorkConnectionErrorMassage
//        }else if errorCode < 2000{
//            message =  "invalid service"
//        }
//        
//        Util.sharedInstance.showAlertMessage(message, messageType: Util.AlertMessageType.ERROR) { (alert, num) in
//            handle?()
//        }
    }
    
    func showErrorWithErrorMessage(message: String){
        
    }
    
//    func showHub(){
//        Util.sharedInstance.showHudOnView(self)
//    }
//    
//    func showHubWithText(text: String){
//        Util.sharedInstance.showLoadingWithText(text)
//    }
//    
//    func hideAllHub(){
//        Util.sharedInstance.hideAllHud(self)
//    }
    
    //Mark: Frame and Size
    var size: CGSize{
        return self.frame.size
    }
    
    var height : CGFloat {
        return self.size.height
    }
    
    var width: CGFloat{
        return self.size.width
    }
    
    var origin: CGPoint{
        return self.frame.origin
    }
    
    var x: CGFloat{
        return self.origin.x
    }
    
    var y: CGFloat{
        return self.origin.y
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(self * divisor) / divisor
    }
}

extension Float {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return round(self * divisor) / divisor
    }
}



