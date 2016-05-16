//
//  AMZNLogoutDelegate.swift
//  LoginWithAmazonSample
//
//  Created by Z on 5/14/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

class AMZNLogoutDelegate: NSObject, AIAuthenticationDelegate {
    
    func requestDidSucceed(apiResult: APIResult!) {
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.postNotificationName("UserSuccessfullyLoggedOut", object: self)
    }
    
    func requestDidFail(errorResponse: APIError!) {
        Alert.presentMessage(errorResponse.error.message, title: "User Logout Failed")
    }
}
