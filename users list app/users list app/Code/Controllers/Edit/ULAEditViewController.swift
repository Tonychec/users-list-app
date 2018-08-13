//
//  ULAEditViewController.swift
//  users list app
//
//  Created by iosNomad on 8/13/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//

import UIKit
import IHKeyboardAvoiding

class ULAEditViewController: UIViewController {

    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var changePhotoLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: ULAFormatedTextField!
    @IBOutlet weak var scrollViewBottomOffset: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private(set) lazy var imagePicker: ULAImagePicker = {
        let picker = ULAImagePicker()
        picker.imagePickerDelegate = self
        return picker
    }()
    
    var user: ULAUser
    var saveCallBack: ((ULAUser) -> Void)?
    
    init(user: ULAUser) {
        self.user = user
        super.init(nibName: String(describing: ULAEditViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillUI()
        configureInteractions()
        setupKeyboardAvoiding()
    }
}

//MARK: - Configurations
extension ULAEditViewController {
    
    func fillUI() {
        if let imageData = user.picture?.image as Data? {
            avatarView.image = UIImage(data: imageData, scale: 1.0)
        } else if let avatarURLStr = user.picture?.large {
            avatarView.sd_setImage(with: URL(string: avatarURLStr), placeholderImage: #imageLiteral(resourceName: "placeholderAvatar"), options: []) { [weak self] (image, _, _, _) in
                if let image = image {
                    self?.user.picture?.image = UIImagePNGRepresentation(image) as NSData?
                    self?.user.managedObjectContext?.blockAndSave()
                    self?.avatarView.image = image
                }
            }
        } else {
            avatarView.image = #imageLiteral(resourceName: "placeholderAvatar")
        }
        
        firstNameTextField.placeholder = user.name.first
        lastNameTextField.placeholder = user.name.last
        emailTextField.placeholder = user.email
        phoneTextField.placeholder = user.phone
    }
    
    func configureInteractions() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: ULAStrings.Actions.save.rawValue, style: .done, target: self, action: #selector(saveWassPressed))
        
        changePhotoLabel.isUserInteractionEnabled = true
        changePhotoLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imagePickerWassPressed)))
        
        phoneTextField.setFormatting("(###)-###-##-##", replacementChar: "#")
    }
    
    func setupKeyboardAvoiding() {
        KeyboardAvoiding.avoidingBlock = { [weak self] (isKeyboardShowing, animationDuration, keyboardHeight, _) in
            guard let `self` = self else {
                return
            }
            
            let scrollViewBottomOffset = (isKeyboardShowing) ? keyboardHeight : 0
            
            self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, scrollViewBottomOffset, 0)
        }
    }
}

//MARK: - ULAImagePickerDelegate
extension ULAEditViewController: ULAImagePickerDelegate {
    
    func imagePicker(_ imagePicker: ULAImagePicker, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = editedImage
        }
        
        if let image = image {
            avatarView.image = image
        }
    }
}

//MARK: - Actions
extension ULAEditViewController {
    
    @objc func saveWassPressed() {
        if let firstName = firstNameTextField.text, !firstName.isEmpty {
            guard ULAValidator.showErrorAlertIfNeeded(validationResult: firstName.isLengthValid(stringPrefixForErrorMessage: "First name"), viewController: self) else {
                return
            }
            user.name.first = firstName
        }
        
        if let lastName = lastNameTextField.text, !lastName.isEmpty {
            guard ULAValidator.showErrorAlertIfNeeded(validationResult: lastName.isLengthValid(stringPrefixForErrorMessage: "Lasst name"), viewController: self) else {
                return
            }
            user.name.last = lastName
        }
        
        if let email = emailTextField.text, !email.isEmpty {
            guard ULAValidator.showErrorAlertIfNeeded(validationResult: email.isEmailValid(), viewController: self) else {
                return
            }
            user.email = email
        }
        
        if let phone = phoneTextField.text, !phone.isEmpty {
            user.phone = phone
        }
        
        if let image = avatarView.image {
            user.picture?.image = UIImagePNGRepresentation(image) as? NSData
        }
        
        user.isSaved = true
        user.managedObjectContext?.blockAndSave()
        saveCallBack?(user)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func imagePickerWassPressed() {
        imagePicker.presentPicker(fromViewController: self)
    }
}
