//
//  AMZNGetAccessTokenDelegate.swift
//  LoginWithAmazonSample
//
//  Created by Z on 5/14/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

class AMZNGetAccessTokenDelegate: NSObject, AIAuthenticationDelegate {
    
    func requestDidSucceed(apiResult: APIResult!) {        
        let amazonGetProfileDelegate = AMZNGetProfileDelegate()
        AIMobileLib.getProfile(amazonGetProfileDelegate)
    }
    
    func requestDidFail(errorResponse: APIError!) {
        Alert.presentMessage(errorResponse.error.message, title: "Please Login")
    }

}
