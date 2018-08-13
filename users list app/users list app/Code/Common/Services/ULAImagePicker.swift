//
//  ULAImagePicker.swift
//  users list app
//
//  Created by iosNomad on 8/13/18.
//  Copyright © 2018 iosNomad. All rights reserved.
//


import UIKit

protocol ULAImagePickerDelegate: class {
    func imagePicker(_ imagePicker: ULAImagePicker, didFinishPickingMediaWithInfo info: [String : Any])
}

class ULAImagePicker: NSObject {
    
    private(set) lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        
        return picker
    }()
    
    weak var imagePickerDelegate: ULAImagePickerDelegate?
    
    func presentPicker(fromViewController: UIViewController) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: ULAStrings.Actions.camera.rawValue, style: .default, handler: { _ in
                self.imagePicker.sourceType = .camera
                self.showPicker(fromViewController: fromViewController)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(UIAlertAction(title: ULAStrings.Actions.photoLibrary.rawValue, style: .default, handler: { _ in
                self.imagePicker.sourceType = .photoLibrary
                self.showPicker(fromViewController: fromViewController)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: ULAStrings.Actions.cancel.rawValue, style: .cancel, handler: nil))
        fromViewController.present(actionSheet, animated: true, completion: nil)
    }
    
    private func showPicker(fromViewController: UIViewController) {
        fromViewController.present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ULAImagePicker: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePickerDelegate?.imagePicker(self, didFinishPickingMediaWithInfo: info)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
