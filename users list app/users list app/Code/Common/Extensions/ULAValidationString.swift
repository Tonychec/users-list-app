//
//  ULAValidationString.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//


import Foundation

typealias FFValidationString = String
typealias FFValidationResult = (isValid: Bool, errorMessage: String?)

extension FFValidationString {
    
    func isEmailValid() -> FFValidationResult {
        guard !self.isEmpty else {
            return (false, ULAStrings.Validation.emailBlank.rawValue)
        }
        
        let emailRegex = "^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{2,})+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = predicate.evaluate(with:self)
        
        return (result, result ? nil : ULAStrings.Validation.emailNotValid.rawValue)
    }
    
    func isLengthValid(stringPrefixForErrorMessage: String = "") -> FFValidationResult {
        let errorMessage = stringPrefixForErrorMessage.isEmpty ? ULAStrings.Validation.blank.rawValue.capitalizingFirstLetter() : stringPrefixForErrorMessage + " " + ULAStrings.Validation.blank.rawValue
        let comp = self.components(separatedBy: CharacterSet.whitespaces).filter { !$0.isEmpty }
        
        if comp.count > 1, comp.count < 31 {
            return (true, nil)
        } else {
            return (false, errorMessage)
        }
    }
}
