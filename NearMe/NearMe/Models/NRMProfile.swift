//
//  NRMProfile.swift
//  
//
//  Created by Bryan Keller on 6/27/15.
//
//

import UIKit

import Parse

class NRMProfile: PFObject, PFSubclassing {
    
    @NSManaged var name: String
    @NSManaged var headline: String
    @NSManaged var profilePictureFile: PFFile
    
    var cachedProfilePicture: UIImage?
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Profile"
    }
    
}
