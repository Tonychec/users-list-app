//
//  ULAStringDefines.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import Foundation

class ULAStrings {
    private init() {}
}

//MARK: - Validations
extension ULAStrings {
    
    enum Errors: String {
        case blank = "shouldn't be blank"
        case emailNotValid = "This doesn’t look like a valid email. Please check the inputted email"
        case emailBlank = "Email shouldn't be blank"
        case someError = "Some error occured. Please try again later"
    }
}

//MARK: - Tabs
extension ULAStrings {
    
    enum Tabs: String {
        case users = "Users"
        case saved = "Saved"
    }
}

//MARK: - Pagination
extension ULAStrings {
    
    enum Pagination: String {
        case pagination = "info"
        case currentPage = "page"
        case paginationError = "no pagination in request"
        case results = "results"
    }
}
