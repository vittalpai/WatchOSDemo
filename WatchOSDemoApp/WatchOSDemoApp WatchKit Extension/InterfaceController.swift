//
//  InterfaceController.swift
//  WatchDemoApp WatchKit Extension
//
//  Created by Amichai Meir on 12/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    var isRemoteDisabled = false
    var pinCodeScreenShouldBeDisplayed = false
    
    @IBOutlet var activityIndicatorImage: WKInterfaceImage!
    
    func showActivityIndicator() {
        activityIndicatorImage.setHidden(false)
        activityIndicatorImage.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activityIndicatorImage.stopAnimating()
        self.activityIndicatorImage.setHidden(true)
    }
    
<<<<<<< Updated upstream
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        WLClient.sharedInstance().registerChallengeHandler(MyPinCodeChallengeHandler(ic: self))
        WLClient.sharedInstance().registerChallengeHandler(MyRemoteDisableChallengeHandler(ic:self))
=======
    override func awake(withContext context: Any?)  {
        super.awake(withContext: context)
>>>>>>> Stashed changes
    
        activityIndicatorImage.setHidden(true)
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func balance() {
<<<<<<< Updated upstream
        let address : String = "/adapters/bankAdapter/view/balance";
        let url : NSURL = NSURL(string: address)!
        let request : WLResourceRequest = WLResourceRequest(URL: url, method: WLHttpMethodGet);
        
        self.showActivityIndicator()
        
        request.sendWithCompletionHandler { (response:WLResponse!, error:NSError!) -> Void in
            var title : String;
            var message : String;
            if((error) != nil){
                title = "Error";
                message = error.description;
                NSLog("Adapter invocation failure. Error: %@", error);
            }
            else{
                title = "Balance";
                let balance = response.getResponseJson()["balance"]!
                message = "Your balance is \(balance)$"
            }
            
            let act : WKAlertAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.Default, handler: { () -> Void in
                
            })
            let actions : [WKAlertAction] = [act];
            
            self.hideActivityIndicator()
            
            //If remote disabled, we showed error message already in MyRemoteDisableChallengeHandler
            if (!self.isRemoteDisabled) {
                self.presentAlertControllerWithTitle(title, message: message, preferredStyle: WKAlertControllerStyle.Alert, actions: actions)
            }
            else {
                self.isRemoteDisabled = false;
            }
        }
=======
       
        self.showActivityIndicator()
        //sleep(5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of var var title = "Balance";
            
        let title = "Mod Resorts";
        let message = "Your Booking ID 92138XZA for BLR TO SFO on 9th Mar 2020 is confirmed.\n\n  Check-in Timings : 9:00 AM IST"
        let act : WKAlertAction = WKAlertAction(title: "OK", style: WKAlertActionStyle.default, handler: { () -> Void in
                       
                   })
                   let actions : [WKAlertAction] = [act];
                   
                   self.hideActivityIndicator()
                   
                   //If remote disabled, we showed error message already in MyRemoteDisableChallengeHandler
                   if (!self.isRemoteDisabled) {
                       self.presentAlert(withTitle: title, message: message, preferredStyle: WKAlertControllerStyle.alert, actions: actions)
                   }
                   else {
                       self.isRemoteDisabled = false;
                   }
        }
        
>>>>>>> Stashed changes
        
    }
    
}
