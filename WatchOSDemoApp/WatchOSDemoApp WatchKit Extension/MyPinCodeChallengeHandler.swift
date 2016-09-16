//
//  MyChallengeHandler.swift
//  WatchDemoApp
//
//  Created by Amichai Meir on 12/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundationWatchOS

class MyPinCodeChallengeHandler : SecurityCheckChallengeHandler {
    
    var ic : InterfaceController
    
    var isFirstTime = true
    
    init(ic: InterfaceController) {
        self.ic = ic
        super.init(securityCheck: "pinCode")
    }
    
    override func handleSuccess(success: [NSObject : AnyObject]!) {
        NSLog("Challenge success");
        isFirstTime = true
        self.ic.popController()
    }
    
    override func handleFailure(failure: [NSObject : AnyObject]!) {
        NSLog("Challenge failed");
    }
    
    override func handleChallenge(challenge: [NSObject : AnyObject]!) {
        NSLog("A pin code screen should appear");
        var contextDictionary = [String:AnyObject]()
        contextDictionary["challengeHandler"] = self
        contextDictionary["firstTime"] = isFirstTime
        
        self.ic.pushControllerWithName("PinCodeController", context: contextDictionary)
        self.ic.pinCodeScreenShouldBeDisplayed = true
        self.ic.pinCodeChallengeHandler = self
        isFirstTime = false
    }
}

