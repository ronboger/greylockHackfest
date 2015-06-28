//
//  DiscoverViewController.swift
//  NearMe
//
//  Created by Bryan Keller on 6/27/15.
//  Copyright (c) 2015 Greylock Hackathon. All rights reserved.
//

import UIKit

import Parse

class DiscoverViewController: UIViewController {

    @IBOutlet private weak var discoveryTableView: UITableView!
    
    private var discoveryTableViewDataSource: DiscoveryTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataRefreshTimer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("refreshDataAsynchonously"), userInfo: nil, repeats: true)
        dataRefreshTimer.fire()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshDataAsynchonously() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            
            let query = NRMProfile.query()!
            if let profiles = query.findObjects() as? [NRMProfile] {
                for profile in profiles {
                    let imageData = profile.profilePictureFile.getData()
                    profile.cachedProfilePicture = UIImage(data: imageData!)
                }
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.discoveryTableViewDataSource = DiscoveryTableViewDataSource(profiles: profiles)
                    self.discoveryTableView.dataSource = self.discoveryTableViewDataSource
                    self.discoveryTableView.reloadData()
                    
                })
            }
            
        })
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let profile = self.discoveryTableViewDataSource.profiles[self.discoveryTableView.indexPathForSelectedRow()!.row]
        let profileViewController = segue.destinationViewController as! ProfileViewController
        profileViewController.profile = profile
        self.discoveryTableView.deselectRowAtIndexPath(self.discoveryTableView.indexPathForSelectedRow()!, animated: true)
    }
}

