//
//  AMZNGetProfileDelegate.swift
//  LoginWithAmazonSample
//
//  Created by Z on 5/14/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

class AMZNGetProfileDelegate: NSObject, AIAuthenticationDelegate {
    
    func requestDidSucceed(apiResult: APIResult!) {
        let resultDictionary = apiResult.result as! Dictionary<String,String>

        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("UserSuccessfullyLoggedIn", object: self, userInfo: resultDictionary)
    }
    
    func requestDidFail(errorResponse: APIError!) {
       Alert.presentMessage(errorResponse.error.message, title: "Error Occured")
    }
    
}
