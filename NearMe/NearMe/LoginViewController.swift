//
//  LoginViewController.swift
//  NearMe
//
//  Created by Bryan Keller on 6/27/15.
//  Copyright (c) 2015 Greylock Hackathon. All rights reserved.
//

import UIKit

import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func isInputValid() -> Bool {
        return !(self.emailTextField.text == "" || self.passwordtextField.text == "")
    }
    
    func displayInvalidInputAlert() {
        let alertController = UIAlertController(title: "Fill in required fields", message: "Please fill all the fields yo", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
            
            alertController.dismissViewControllerAnimated(true, completion: nil)
            
        })
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signupButtonTapped() {
        if (!self.isInputValid()) {
            self.displayInvalidInputAlert()
            return
        }
        
        let testObject = PFObject(className: "TestObject")
        testObject.saveInBackgroundWithBlock { (successful, error) -> Void in
            
            
            
        }
        // Signup code
    }
    
    @IBAction func loginButtonTapped() {
        if (!self.isInputValid()) {
            self.displayInvalidInputAlert()
            return
        }
        
        // Login code
    }
}
