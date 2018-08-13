//
//  ULAUserTableViewCell.swift
//  users list app
//
//  Created by iosNomad on 8/9/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import SMDataDiller
import SDWebImage

class ULAUserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phonLabel: UILabel!
    
}

//MARK: - SMCell
extension ULAUserTableViewCell: SMCell {

    func fill(with domainObject: Any!) {

        guard let item = domainObject as? ULAUser else {
            return
        }

        if let imageData = item.picture?.image as Data? {
            avatar.image = UIImage(data: imageData, scale: 1.0)
        } else if let avatarURLStr = item.picture?.large {
            avatar.sd_setImage(with: URL(string: avatarURLStr), placeholderImage: #imageLiteral(resourceName: "placeholderAvatar"), options: []) { [weak self] (image, _, _, _) in
                if let image = image {
                    item.picture?.image = UIImagePNGRepresentation(image) as NSData?
                    item.managedObjectContext?.blockAndSave()
                    self?.avatar.image = image
                }
            }
        } else {
            avatar.image = #imageLiteral(resourceName: "placeholderAvatar")
        }
        nameLabel.text = item.fullName
        phonLabel.text = item.phone
    }

    static func nibName() -> String! {
        return String(describing: ULAUserTableViewCell.self)
    }
}
