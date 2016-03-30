//
//  MyRemoteDisableChallengeHandler.swift
//  WatchOSDemoApp
//
//  Created by Amichai Meir on 18/02/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import WatchKit
import IBMMobileFirstPlatformFoundationWatchOS

class MyRemoteDisableChallengeHandler : WLChallengeHandler {
    
    var ic : InterfaceController
    var messageId : String?
    
    init(ic: InterfaceController) {
        self.ic = ic
        super.init(securityCheck: "wl_remoteDisableRealm")
    }
    
    //Blocking an application
    override func handleFailure(failure: [NSObject : AnyObject]!) {
        let message = failure["message"] as! String
        
        let act : WKAlertAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.Default, handler: { () -> Void in
            
        })
        let actions : [WKAlertAction] = [act];
        
        ic.presentAlertControllerWithTitle("Application Disabled", message: message, preferredStyle: WKAlertControllerStyle.Alert, actions: actions)
        
        ic.isRemoteDisabled = true
    }
    
    //Notifying an application
    override func handleChallenge(challenge: [NSObject : AnyObject]!) {
        let message = challenge["message"] as! String
        let msgId = challenge["messageId"] as! String
        
        self.messageId = msgId;
    
        let act : WKAlertAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            self.submitAnswer()
            if (self.ic.pinCodeScreenShouldBeDisplayed) {
                var contextDictionary = [String:AnyObject]()
                contextDictionary["challengeHandler"] = self.ic.pinCodeChallengeHandler
                contextDictionary["firstTime"] = true
                self.ic.pushControllerWithName("PinCodeController", context: contextDictionary)
            }
        })
        let actions : [WKAlertAction] = [act];
        
        ic.presentAlertControllerWithTitle("Notification", message: message, preferredStyle: WKAlertControllerStyle.Alert, actions: actions)
    }
    
    
    func submitAnswer() {
        var answerDict : [NSObject : AnyObject] = [NSObject : AnyObject]()
        answerDict["messageId"] = self.messageId
        self.submitChallengeAnswer(answerDict)
    }
}


