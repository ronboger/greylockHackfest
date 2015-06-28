//
//  DiscoveryTableViewDataSource.swift
//  
//
//  Created by Bryan Keller on 6/27/15.
//
//

import UIKit

class DiscoveryTableViewDataSource: NSObject, UITableViewDataSource {
    
    var profiles: [NRMProfile] = []
    
    init(profiles: [NRMProfile]) {
        self.profiles = profiles
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfilePreviewTableViewCell") as! ProfilePreviewTableViewCell!
        cell.profile = self.profiles[indexPath.row]
        return cell
    }
    
}
