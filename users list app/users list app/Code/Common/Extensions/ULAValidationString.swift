//
//  ULAValidationString.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//


import Foundation

typealias ULAValidationString = String
typealias ULAValidationResult = (isValid: Bool, errorMessage: String?)

extension ULAValidationString {
    
    func isEmailValid() -> ULAValidationResult {
        guard !self.isEmpty else {
            return (false, ULAStrings.Errors.emailBlank.rawValue)
        }
        
        let emailRegex = "^[+\\w\\.\\-']+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{2,})+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = predicate.evaluate(with:self)
        
        return (result, result ? nil : ULAStrings.Errors.emailNotValid.rawValue)
    }
    
    func isLengthValid(stringPrefixForErrorMessage: String = "") -> ULAValidationResult {
        let errorMessage = stringPrefixForErrorMessage.isEmpty ? ULAStrings.Errors.length.rawValue.capitalizingFirstLetter() : stringPrefixForErrorMessage + " " + ULAStrings.Errors.length.rawValue
        let comp = self.trimmingCharacters(in: .whitespaces)
        
        if comp.count > 1, comp.count < 31 {
            return (true, nil)
        } else {
            return (false, errorMessage)
        }
    }
}
