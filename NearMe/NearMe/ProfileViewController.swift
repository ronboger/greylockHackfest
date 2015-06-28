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
    
    var profile: NRMProfile? {
        didSet {
            self.refreshScreenData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshScreenData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.profilePictureImageView.layer.borderColor = UIColor.redColor().CGColor
        self.profilePictureImageView.layer.borderWidth = 3.0
        self.profilePictureImageView.layer.cornerRadius = self.profilePictureImageView.bounds.size.width / 2
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
