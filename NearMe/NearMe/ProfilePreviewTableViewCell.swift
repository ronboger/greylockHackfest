//
//  ProfilePreviewTableViewCell.swift
//  NearMe
//
//  Created by Bryan Keller on 6/27/15.
//  Copyright (c) 2015 Greylock Hackathon. All rights reserved.
//

import UIKit

class ProfilePreviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    var profile: NRMProfile? {
        didSet {
            self.nameLabel.text = self.profile?.name
            self.headlineLabel.text = self.profile?.headline
            self.profilePictureImageView.image = self.profile?.cachedProfilePicture
            println(self.profile!.skills)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.profilePictureImageView.layer.borderColor = UIColor(red:0.29, green:0.41, blue:0.66, alpha:1).CGColor
        self.profilePictureImageView.layer.borderWidth = 3
        self.profilePictureImageView.layer.cornerRadius = self.profilePictureImageView.bounds.size.width / 2
    }
}
