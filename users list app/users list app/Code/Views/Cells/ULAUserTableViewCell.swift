//
//  ULAUserTableViewCell.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMDataDiller

class ULAUserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phonLabel: UILabel!
    
}

////MARK: - SMCell
//extension ULAUserTableViewCell: SMCell {
//
//    func fill(with domainObject: Any!) {
//
//        guard let item = domainObject as? FFNotification else {
//            return
//        }phonLabel
//
//        avatar.sd_setImage(with: , placeholderImage: #imageLiteral(resourceName: "placeholderAvatar"), options: []) { [weak self] (image, _, _, _) in
//            if let image = image {
//                self?.avatarImageView.image = image
//            }
//        }
//        nameLabel.text = ""
//        phonLabel.text = ""
//    }
//
//    static func nibName() -> String! {
//        return String(describing: ULAUserTableViewCell.self)
//    }
//}
