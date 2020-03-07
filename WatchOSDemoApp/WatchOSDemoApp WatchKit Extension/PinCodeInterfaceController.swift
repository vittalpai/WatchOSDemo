//
//  PincodeInterfaceController.swift
//  WatchDemoApp
//
//  Created by Amichai Meir on 13/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import WatchKit
import IBMMobileFirstPlatformFoundationWatchOS

class PinCodeInterfaceController : WKInterfaceController {
    
    @IBOutlet var errorMsg: WKInterfaceLabel!
    
    var challengeHandler : MyPinCodeChallengeHandler!
    var didSendPinCode = false
    
    var pinCode = ""
    var digitsCounter = 0
    
    override func awake(withContext context: Any?)  {
        
        
        let contextDictionary : [String : AnyObject] = context as! [String : AnyObject]
        self.challengeHandler = contextDictionary["challengeHandler"] as! MyPinCodeChallengeHandler
        let isFirstTime : Bool = contextDictionary["firstTime"] as! Bool
        if (isFirstTime) {
            self.errorMsg.setHidden(true)
        }
        else {
            self.errorMsg.setHidden(false)
        }
        
        pinCode = ""
        digitsCounter = 0
        
        self.challengeHandler.ic.pinCodeScreenShouldBeDisplayed = false
        
    }
    
    override func willDisappear() {
        if (!didSendPinCode) {
            self.challengeHandler.cancel()
            self.challengeHandler.isFirstTime = true
        }
        super.willDisappear()
    }
    
    @IBAction func button1Pressed() {
        buttonPressed(number: 1)
    }
    
    @IBAction func button2Pressed() {
        buttonPressed(number: 2)
    }
    
    @IBAction func button3Pressed() {
        buttonPressed(number: 3)
    }
    
    @IBAction func button4Pressed() {
        buttonPressed(number: 4)
    }
    
    @IBAction func button5Pressed() {
        buttonPressed(number: 5)
    }
    
    @IBAction func button6Pressed() {
        buttonPressed(number: 6)
    }
    
    @IBAction func button7Pressed() {
        buttonPressed(number: 7)
    }
    
    @IBAction func button8Pressed() {
        buttonPressed(number: 8)
    }
    
    @IBAction func button9Pressed() {
        buttonPressed(number: 9)
    }
    
    @IBAction func button0Pressed() {
        buttonPressed(number: 0)
    }
    
    func buttonPressed(number:Int) {
        pinCode = pinCode + String(number)
        digitsCounter = digitsCounter + 1
    }
    
    @IBAction func sendPinCode() {
        var challengeAnswer : Dictionary<String, String>  = [String : String]()
        challengeAnswer["pinCode"] = pinCode
        self.challengeHandler.submitChallengeAnswer(challengeAnswer)
        self.pop()
        self.didSendPinCode = true
    }
    
}
