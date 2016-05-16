//
//  Alert.swift
//  LoginWithAmazonSample
//
//  Created by Z on 5/15/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

import UIKit

class Alert {
     class func presentMessage(message: String, title: String = "") {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alertView, animated: true, completion: nil)
    }
}
    

