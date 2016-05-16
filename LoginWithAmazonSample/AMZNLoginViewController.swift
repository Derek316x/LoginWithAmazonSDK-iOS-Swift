//
//  AMZNLoginViewController.swift
//  LoginWithAmazonSample
//
//  Created by Z on 5/14/16.
//  Copyright © 2016 dereknetto. All rights reserved.
//

import UIKit

class AMZNLoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var postalCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: #selector(AMZNLoginViewController.updateInfoLabels(_:)), name: "UserSuccessfullyLoggedIn", object: nil)
         notificationCenter.addObserver(self, selector: #selector(AMZNLoginViewController.clearInfoLabels(_:)), name: "UserSuccessfullyLoggedOut", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkIsUserSignedIn()
    }
    
    @IBAction func loginButtonTouched(sender: UIButton) {
        let amazonAuthorizeUserDelegate = AMZNAuthorizeUserDelegate();
        let requestScopes = ["profile","postal_code"]
        
        AIMobileLib.authorizeUserForScopes(requestScopes, delegate: amazonAuthorizeUserDelegate)
    }
    
    @IBAction func logoutButtonTouched(sender: UIBarButtonItem) {
        let amazonLogoutDelegate = AMZNLogoutDelegate()
        AIMobileLib.clearAuthorizationState(amazonLogoutDelegate)
    }
    
    func checkIsUserSignedIn() {
        let amazonGetAccessTokenDelegate = AMZNGetAccessTokenDelegate()
        let requestScopes = ["profile","postal_code"]
        
        AIMobileLib.getAccessTokenForScopes(requestScopes, withOverrideParams: nil, delegate: amazonGetAccessTokenDelegate)
    }
    
    func updateInfoLabels(notification: NSNotification) {
        let userInfo = notification.userInfo as! [String: String]
        
        self.nameLabel.text = "Name: " + userInfo["name"]!
        self.userIDLabel.text = "UserID: " + userInfo["user_id"]!
        self.emailLabel.text  = "Email: " + userInfo["email"]!
        
        if let postalCode = userInfo["postal_code"]{ 
            self.postalCodeLabel.text = "Postal Code: " + postalCode
        }
    }
    
    func clearInfoLabels(notification: NSNotification){
        self.nameLabel.text = "Name: "
        self.userIDLabel.text = "UserID: "
        self.emailLabel.text = "Email: "
        self.postalCodeLabel.text = "Postal Code: "
    }
}
