//
//  ULAUsersDataProvider.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation

class ULAUsersDataProvider: ULABaseCoreDataProvider {
    
    init() {
        super.init(withEntityName: User.entityName())
    }
}
