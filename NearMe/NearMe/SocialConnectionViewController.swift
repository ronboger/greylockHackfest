//
//  SocialConnectionViewController.swift
//  
//
//  Created by Bryan Keller on 6/28/15.
//
//

import UIKit

import FBSDKLoginKit

class SocialConnectionViewController: UIViewController {
    
    @IBOutlet private weak var facebookButton: UIButton!
    @IBOutlet private weak var linkedinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.facebookButton.layer.cornerRadius = self.facebookButton.bounds.width / 2
        self.linkedinButton.layer.cornerRadius = self.linkedinButton.bounds.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookButtonTapped() {
        let facebookLoginManager = FBSDKLoginManager()
        facebookLoginManager.logInWithReadPermissions(["public_profile", "user_friends"], handler: { (result: FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
            
            if (error != nil) {
                // Process error
            }
            else if (result.isCancelled) {
                // Handle cancellations
            }
            else {
                // If you ask for multiple permissions at once, you
                // should check if specific permissions missing
                if (result.grantedPermissions.contains("public_profile") && result.grantedPermissions.contains("user_friends")) {
                    println(result.token.tokenString)
                }
            }
            
        })
    }
    
    @IBAction func linkedinButtonTapped() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
