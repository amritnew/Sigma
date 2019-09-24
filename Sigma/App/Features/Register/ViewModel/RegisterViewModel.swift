//
//  RegisterViewModel.swift
//  Sigma
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import FirebaseAuth
import FirebaseStorage

struct RegisterViewModel {
    
    let firebaseAuth = Auth.auth()
    
    let storage = Storage.storage()
    
    func register(withEmail email: String?, withPassword password: String?, completion: @escaping (Bool) -> ()) {
        guard let userEmail = email, let userPassword = password else {
            return completion(false)
        }
        
        firebaseAuth.createUser(withEmail: userEmail, password: userPassword) { (result, error) in
            if error != nil {
                return completion(false)
            }
            completion(true)
        }
    }
    
    func createReferenceImage(withImageData data: Data) {
        let userId = firebaseAuth.currentUser?.uid
        let uploadRef = Storage.storage().reference(withPath: "users/\(userId ?? "")/\(userId ?? "").jpg")
        
        let uploadMetaData = StorageMetadata.init()
        uploadMetaData.contentType = "image/jpeg"
        
        uploadRef.putData(data, metadata: uploadMetaData) { (downloadMetaData, error) in
            if let err = error {
                print("Error in task to reference: \(err)")
                return
            }
        }
    }
}
