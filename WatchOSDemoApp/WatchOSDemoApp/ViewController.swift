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
        let request : WLResourceRequest = WLResourceRequest(url: url as URL, method: WLHttpMethodGet);
        
        //self.showActivityIndicator()
        
        request.send { (response, error) in
            var message : String;
            var title : String;
            if((error) != nil){
                title = "Error";
                message = error!.localizedDescription;
                print("Adapter invocation failure. Error: %@", error!);
            }
            else{
                title = "Balance";
                let balance = response!.getJson()["balance"]!
                message = "Your balance is \(balance)$"
            }
            
            
            //self.hideActivityIndicator()
            
            let adapterResponseAlert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
            let ok : UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
                adapterResponseAlert.dismiss(animated: true, completion: nil)
            })
            adapterResponseAlert.addAction(ok)
            
            self.present(adapterResponseAlert, animated: true, completion: nil)
        }

    }
    
}

