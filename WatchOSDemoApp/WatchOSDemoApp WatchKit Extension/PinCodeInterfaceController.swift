//
//  PincodeInterfaceController.swift
//  WatchDemoApp
//
//  Created by Amichai Meir on 13/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import WatchKit

class PinCodeInterfaceController : WKInterfaceController {
    
    @IBOutlet var errorMsg: WKInterfaceLabel!
    var didSendPinCode = false
    
    var pinCode = ""
    var digitsCounter = 0
    
    override func awakeWithContext(context: AnyObject?) {
        
        
        let contextDictionary : [String : AnyObject] = context as! [String : AnyObject]
        let isFirstTime : Bool = contextDictionary["firstTime"] as! Bool
        if (isFirstTime) {
            self.errorMsg.setHidden(true)
        }
        else {
            self.errorMsg.setHidden(false)
        }
        
        pinCode = ""
        digitsCounter = 0
        
       
    }
    
    override func willDisappear() {
       
        super.willDisappear()
    }
    
    @IBAction func button1Pressed() {
        buttonPressed(1)
    }
    
    @IBAction func button2Pressed() {
        buttonPressed(2)
    }
    
    @IBAction func button3Pressed() {
        buttonPressed(3)
    }
    
    @IBAction func button4Pressed() {
        buttonPressed(4)
    }
    
    @IBAction func button5Pressed() {
        buttonPressed(5)
    }
    
    @IBAction func button6Pressed() {
        buttonPressed(6)
    }
    
    @IBAction func button7Pressed() {
        buttonPressed(7)
    }
    
    @IBAction func button8Pressed() {
        buttonPressed(8)
    }
    
    @IBAction func button9Pressed() {
        buttonPressed(9)
    }
    
    @IBAction func button0Pressed() {
        buttonPressed(0)
    }
    
    func buttonPressed(number:Int) {
        pinCode = pinCode + String(number)
        digitsCounter++
    }
    
    @IBAction func sendPinCode() {
<<<<<<< Updated upstream
        var challengeAnswer : Dictionary<String, String>  = [String : String]()
        challengeAnswer["pinCode"] = pinCode
        self.challengeHandler.submitChallengeAnswer(challengeAnswer)
        self.popController()
=======
        self.pop()
>>>>>>> Stashed changes
        self.didSendPinCode = true
    }
    
}
