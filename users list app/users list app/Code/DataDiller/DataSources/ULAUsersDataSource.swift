//
//  ULAUsersDataSource.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit

class ULAUsersDataSource: ULABaseCoreTableViewDataSource {
    
    override func classForCell(at indexPath: IndexPath!) -> AnyClass! {
        return ULAUserTableViewCell.self
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

