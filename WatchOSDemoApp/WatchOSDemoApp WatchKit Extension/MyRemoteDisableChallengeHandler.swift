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

class MyRemoteDisableChallengeHandler : SecurityCheckChallengeHandler {
    
    var ic : InterfaceController
    var messageId : String?
    
    init(ic: InterfaceController) {
        self.ic = ic
        super.init(securityCheck: "wl_remoteDisableRealm")
    }
    
    //Blocking an application
    override func handleFailure(_ failure: [AnyHashable : Any]!) {
        let message = failure!["message"] as! String
        
        let act : WKAlertAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.default, handler: { () -> Void in
            
        })
        let actions : [WKAlertAction] = [act];
        
        ic.presentAlert(withTitle: "Application Disabled", message: message, preferredStyle: WKAlertControllerStyle.alert, actions: actions)
        
        ic.isRemoteDisabled = true
    }
    
    //Notifying an application
    override func handleChallenge(_ challenge: [AnyHashable : Any]!) {
        let message = challenge["message"] as! String
        let msgId = challenge["messageId"] as! String
        
        self.messageId = msgId;
    
        let act : WKAlertAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.cancel, handler: { () -> Void in
            self.submitAnswer()
            if (self.ic.pinCodeScreenShouldBeDisplayed) {
                var contextDictionary = [String:AnyObject]()
                contextDictionary["challengeHandler"] = self.ic.pinCodeChallengeHandler
                contextDictionary["firstTime"] = true as AnyObject
                self.ic.pushController(withName: "PinCodeController", context: contextDictionary)
            }
        })
        let actions : [WKAlertAction] = [act];
        
        ic.presentAlert(withTitle: "Notification", message: message, preferredStyle: WKAlertControllerStyle.alert, actions: actions)
    }
    
    
    func submitAnswer() {
        var answerDict : [AnyHashable : Any] = [AnyHashable : Any]()
        answerDict["messageId"] = self.messageId
        self.submitChallengeAnswer(answerDict)
    }
}


