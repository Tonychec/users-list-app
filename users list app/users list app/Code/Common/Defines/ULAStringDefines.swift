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
    enum Errors: RawRepresentable {
        typealias RawValue = String
        
        case blank
        case emailNotValid
        case emailBlank
        case someError
        
        var rawValue: String {
            switch self {
            case .blank:
                return "shouldn't be blank"
                
            case .emailNotValid:
                return "This doesn’t look like a valid email. Please check the inputted email"
                
            case .emailBlank:
                return "Email shouldn't be blank"
                
            case .someError:
                return "Some error occured. Please try again later"
            }
        }
        
        init?(rawValue: String) {
            return nil
        }
    }
}

//MARK: - Tabs
extension ULAStrings {
    enum Tabs: RawRepresentable {
        typealias RawValue = String
        
        case users
        case saved
        
        var rawValue: String {
            switch self {
            case .users:
                return "Users"
                
            case .saved:
                return "Saved"
            }
        }
        
        init?(rawValue: String) {
            return nil
        }
    }
}
