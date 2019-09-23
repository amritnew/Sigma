//
//  RegisterController+Camera.swift
//  Sigma
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension RegisterController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func presentImagePickerOptions() {
        let alert =
            UIAlertController.buildActionSheet(title: "Image Options ", message: "")
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in self.openImagePicker(sourceType: .camera) }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in self.openImagePicker(sourceType: .photoLibrary) }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in alert.dismiss(animated: true, completion: nil) }))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func openImagePicker(sourceType: UIImagePickerController.SourceType) {
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            if let loginView = usedView as? RegisterView {
                loginView.roundImage.contentMode = UIView.ContentMode.scaleAspectFit
                loginView.roundImage.image = selectedImage
                loginView.roundImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
                loginView.roundImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
                imageAlbum = selectedImage
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

