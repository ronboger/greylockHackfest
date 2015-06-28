//
//  ProfileViewController.swift
//  
//
//  Created by Bryan Keller on 6/28/15.
//
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var profilePictureImageView: UIImageView!
    
    @IBOutlet private weak var firstSkillBar: UILabel!
    @IBOutlet private weak var secondSkillBar: UILabel!
    @IBOutlet private weak var thirdSkillBar: UILabel!
    @IBOutlet private weak var fourthSkillBar: UILabel!
    @IBOutlet private weak var fifthSkillBar: UILabel!
    
    var profile: NRMProfile? {
        didSet {
            self.refreshScreenData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshScreenData()
        
        self.firstSkillBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.secondSkillBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.thirdSkillBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.fourthSkillBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.fifthSkillBar.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[firstSkillBar(0@999)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["firstSkillBar": self.firstSkillBar]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[secondSkillBar(0@999)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["secondSkillBar": self.secondSkillBar]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[thirdSkillBar(0@999)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["thirdSkillBar": self.thirdSkillBar]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[fourthSkillBar(0@999)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["fourthSkillBar": self.fourthSkillBar]))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[fifthSkillBar(0@999)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["fifthSkillBar": self.fifthSkillBar]))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.firstSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.secondSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.9, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.thirdSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.8, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.fourthSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.7, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.fifthSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.6, constant: 0))
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.profilePictureImageView.layer.borderColor = UIColor(red:0.29, green:0.41, blue:0.66, alpha:1).CGColor
        self.profilePictureImageView.layer.borderWidth = 3.0
        self.profilePictureImageView.layer.cornerRadius = self.profilePictureImageView.bounds.size.width / 2
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

//        self.view.addConstraint(NSLayoutConstraint(item: self.firstSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: self.secondSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.9, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: self.thirdSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.8, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: self.fourthSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.7, constant: 0))
//        self.view.addConstraint(NSLayoutConstraint(item: self.fifthSkillBar, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.profilePictureImageView, attribute: NSLayoutAttribute.Width, multiplier: 0.6, constant: 0))
//        
//        self.view.setNeedsUpdateConstraints()
//        
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            
//            self.view.layoutIfNeeded()
//            
//        })
        
        
        if (self.nameLabel.text == "Daniel Swann") {
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(10 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                
                let alert = UIAlertController(title: "Daniel Swann is nearby", message: "You were interested in getting to know Daniel because of your mutual interest in Software Development.", preferredStyle: UIAlertControllerStyle.Alert)
                let okAction = UIAlertAction(title: "Sounds good!", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(okAction)
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshScreenData() {
        if self.isViewLoaded() {
            self.nameLabel.text = self.profile?.name
            self.headlineLabel.text = self.profile?.headline
            self.profilePictureImageView.image = self.profile?.cachedProfilePicture
            self.firstSkillBar.text = " " + (self.profile?.skills[0] as! String)
            self.secondSkillBar.text = " " + (self.profile?.skills[1] as! String)
            self.thirdSkillBar.text = " " + (self.profile?.skills[2] as! String)
            self.fourthSkillBar.text = " " + (self.profile?.skills[3] as! String)
            self.fifthSkillBar.text = " " + (self.profile?.skills[4] as! String)
        }
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
