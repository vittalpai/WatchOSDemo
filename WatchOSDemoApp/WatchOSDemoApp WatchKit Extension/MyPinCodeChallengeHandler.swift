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
    
    override func handleSuccess(_ success: [AnyHashable : Any]!) {
        NSLog("Challenge success");
               isFirstTime = true
               self.ic.pop()
    }
    
    override func handleFailure(_ failure: [AnyHashable : Any]!) {
        NSLog("Challenge failed");
    }
    
    override func handleChallenge(_ challenge: [AnyHashable : Any]!) {
        NSLog("A pin code screen should appear");
        var contextDictionary = [String:AnyObject]()
        contextDictionary["challengeHandler"] = self
        contextDictionary["firstTime"] = isFirstTime as AnyObject
        
        self.ic.pushController(withName: "PinCodeController", context: contextDictionary)
        self.ic.pinCodeScreenShouldBeDisplayed = true
        self.ic.pinCodeChallengeHandler = self
        isFirstTime = false
    }
}

