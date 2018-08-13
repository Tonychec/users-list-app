//
//  ULAValidator.swift
//  users list app
//
//  Created by iosNomad on 8/13/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit

class ULAValidator {
    private init() {}

    static func showErrorAlertIfNeeded(validationResult: ULAValidationResult, viewController: UIViewController) -> Bool {
        
        if !validationResult.isValid, let errorMessage = validationResult.errorMessage {
            ULAAlert.showAlert(withText: errorMessage, at: viewController)
            return false
        }
        
        return true
    }
}
