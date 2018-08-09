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
    enum Validation: RawRepresentable {
        typealias RawValue = String
        
        case blank
        case emailNotValid
        case emailBlank
        
        var rawValue: String {
            switch self {
            case .blank:
                return "shouldn't be blank"
                
            case .emailNotValid:
                return "This doesn’t look like a valid email. Please check the inputted email"
                
            case .emailBlank:
                return "Email shouldn't be blank"
            }
        }
        
        init?(rawValue: String) {
            return nil
        }
    }
}
