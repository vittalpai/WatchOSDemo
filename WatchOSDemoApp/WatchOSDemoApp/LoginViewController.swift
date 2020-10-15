//
//  LoginViewController.swift
//  MFPWatchDemoApp
//
//  Created by Amichai Meir on 17/01/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var errorMsg: UILabel!
    
    var firstTime : Bool = true
    
<<<<<<< Updated upstream
    var challengeHandler : MyLoginChallengeHandler!
    
    override func viewWillAppear(animated: Bool) {
=======
    override func viewWillAppear(_ animated: Bool) {
>>>>>>> Stashed changes
        super.viewWillAppear(animated)
        if (firstTime) {
            self.errorMsg.hidden = true
        }
        else {
            self.errorMsg.hidden = false
        }
    }
    
    @IBAction func login(sender: AnyObject) {
<<<<<<< Updated upstream
        var challengeAnswer : Dictionary<String, String>  = [String : String]()
        challengeAnswer["user"] = self.username.text
        challengeAnswer["password"] = self.password.text
        self.challengeHandler.submitChallengeAnswer(challengeAnswer)
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
=======
     //   self.vc.navigationController.popViewController(animated: true)
>>>>>>> Stashed changes
    }
    
    
}
