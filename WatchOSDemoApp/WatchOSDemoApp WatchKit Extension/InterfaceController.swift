//
//  InterfaceController.swift
//  WatchDemoApp WatchKit Extension
//
//  Created by Amichai Meir on 12/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import WatchKit
import Foundation
import IBMMobileFirstPlatformFoundationWatchOS

class InterfaceController: WKInterfaceController {
    
    var isRemoteDisabled = false
    var pinCodeScreenShouldBeDisplayed = false
    var pinCodeChallengeHandler : MyPinCodeChallengeHandler?
    
    @IBOutlet var activityIndicatorImage: WKInterfaceImage!
    
    func showActivityIndicator() {
        activityIndicatorImage.setHidden(false)
        activityIndicatorImage.startAnimating()
    }
    
    func hideActivityIndicator() {
        self.activityIndicatorImage.stopAnimating()
        self.activityIndicatorImage.setHidden(true)
    }
    
    override func awake(withContext context: Any?)  {
        super.awake(withContext: context)
        WLClient.sharedInstance().registerChallengeHandler(MyPinCodeChallengeHandler(ic: self))
        WLClient.sharedInstance().registerChallengeHandler(MyRemoteDisableChallengeHandler(ic:self))
    
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
        let address : String = "/adapters/bankAdapter/view/balance";
        let url : NSURL = NSURL(string: address)!
        let request : WLResourceRequest = WLResourceRequest(url: url as URL, method: WLHttpMethodGet);
        
        self.showActivityIndicator()
       
        request.send(completionHandler: {  (response, error) in
            var title : String;
            var message : String;
            if((error) != nil){
                title = "Error";
                message = error!.localizedDescription;
                print("Adapter invocation failure. Error: %@", error);
            }
            else{
                title = "Balance";
                let balance = response!.getJson()["balance"]!
                message = "Your balance is \(balance)$"
            }
            
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
        })
        
    }
    
}
