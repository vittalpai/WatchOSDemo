//
//  MyChallengeHandler.swift
//  WatchDemoApp
//
//  Created by Amichai Meir on 12/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class MyLoginChallengeHandler : SecurityCheckChallengeHandler {
    
    var vc : ViewController
    
    var isFirstTime = true
    
    init(vc: ViewController) {
        self.vc = vc
        super.init(securityCheck: "usernamePassword")
    }
    
    override func handleSuccess(_ success: [AnyHashable : Any]!) {
        NSLog("Challenge success");
        isFirstTime = true
        self.vc.navigationController?.popViewController(animated: true)
    }
    
    override func handleFailure(_ failure: [AnyHashable : Any]!) {
        NSLog("Challenge failed");
    }
    
    override func handleChallenge(_ challenge: [AnyHashable : Any]!) {
        NSLog("A login form should appear");
        let loginViewController : LoginViewController = self.vc.storyboard!.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginViewController.firstTime = isFirstTime
        loginViewController.challengeHandler = self
        self.vc.present(loginViewController, animated: true, completion: nil)
        isFirstTime = false
    }
    
    
}

