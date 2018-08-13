//
//  ULADefines.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit

let kDefaultAnimationDuration = 0.3

let kBaseURL = "https://randomuser.me/api/"
let kDefaultParams: [String: Any] = ["inc"     : "name,phone,picture,email",
                                     "seed"    : "abc",
                                     "results" : kDefaultResultQuantity]
let kSomeErrorCode = -1
let kDefaultResultQuantity = 10

let kPullRefreshViewHeight: CGFloat = 40
let kDefaultCellHeight: CGFloat = 80
