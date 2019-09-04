//
//  NewTrail+UIPickerDelegate.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension NewTrailController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func presentImagePickerOptions() {
        let alert = UIAlertController(title: "Image Options", message: "", preferredStyle: .actionSheet)
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
            if let customView = usedView as? NewTrailView {
                customView.imageTrail.contentMode = UIView.ContentMode.scaleAspectFit
                customView.imageTrail.image = selectedImage
                customView.imageTrail.widthAnchor.constraint(equalToConstant: 200).isActive = true
                customView.imageTrail.heightAnchor.constraint(equalToConstant: 200).isActive = true
                imageAlbum = selectedImage
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
