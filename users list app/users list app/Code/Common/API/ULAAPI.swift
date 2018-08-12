//
//  ULAAPI.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation
import Alamofire

class ULAAPI {
    static let shared = ULAAPI()
    private init() {}
    
    private static let kDomain = "ULAAPI"
    let kSomeAPIError = NSError(domain: ULAAPI.kDomain, code: kSomeErrorCode, userInfo: [NSLocalizedDescriptionKey : ULAStrings.Errors.someError.rawValue])
    
    func loadUsersListCreationHendler(page: Int = 1) -> DataRequest {
        var params = kDefaultParams
        params["page"] = page
        
        return Alamofire.request(kBaseURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil)
    }
}
