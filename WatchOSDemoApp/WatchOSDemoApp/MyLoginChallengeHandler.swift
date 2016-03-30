//
//  MyChallengeHandler.swift
//  WatchDemoApp
//
//  Created by Amichai Meir on 12/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class MyLoginChallengeHandler : WLChallengeHandler {
    
    var vc : ViewController
    
    var isFirstTime = true
    
    init(vc: ViewController) {
        self.vc = vc
        super.init(securityCheck: "usernamePassword")
    }
    
    override func handleSuccess(success: [NSObject : AnyObject]!) {
        NSLog("Challenge success");
        isFirstTime = true
        self.vc.navigationController?.popViewControllerAnimated(true)
    }
    
    override func handleFailure(failure: [NSObject : AnyObject]!) {
        NSLog("Challenge failed");
    }
    
    override func handleChallenge(challenge: [NSObject : AnyObject]!) {
        NSLog("A login form should appear");
        let loginViewController : LoginViewController = self.vc.storyboard!.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        loginViewController.firstTime = isFirstTime
        loginViewController.challengeHandler = self
        self.vc.presentViewController(loginViewController, animated: true, completion: nil)
        isFirstTime = false
    }
    
    
}

