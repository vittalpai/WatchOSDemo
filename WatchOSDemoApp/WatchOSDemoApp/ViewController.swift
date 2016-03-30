//
//  ViewController.swift
//  MFPWatchDemoApp
//
//  Created by Amichai Meir on 17/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import UIKit
import IBMMobileFirstPlatformFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        WLClient.sharedInstance().registerChallengeHandler(MyLoginChallengeHandler(vc: self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    @IBAction func balance(sender: AnyObject) {
        let address : String = "/adapters/bankAdapter/view/balance";
        let url : NSURL = NSURL(string: address)!
        let request : WLResourceRequest = WLResourceRequest(URL: url, method: WLHttpMethodGet);
        
        //self.showActivityIndicator()
        
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
            
            
            //self.hideActivityIndicator()
            
            let adapterResponseAlert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            let ok : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                adapterResponseAlert.dismissViewControllerAnimated(true, completion: nil)
            })
            adapterResponseAlert.addAction(ok)
            
            self.presentViewController(adapterResponseAlert, animated: true, completion: nil)
        }

    }
    
}

