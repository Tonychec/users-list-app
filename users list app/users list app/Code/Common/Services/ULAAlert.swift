//
//  ULAAlert.swift
//  users list app
//
//  Created by iosNomad on 8/12/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit

class ULAAlert {
    
    class func showAlert(withText text: String, at viewController: UIViewController?) {
        guard let vc = viewController else {
            return
        }
        let alertController = UIAlertController(title: "Hey", message: text, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        vc.present(alertController, animated: true, completion: nil)
    }
}
