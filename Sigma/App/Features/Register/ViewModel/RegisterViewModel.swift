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
                completion(false)
            }
            completion(true)
        }
    }
    
    func createReferenceImage(withImageData data: Data) {
        let randomId = UUID.init().uuidString
        let storageRef = Storage.storage().reference(forURL: "gs://lvlopers.appspot.com/")
        
        storageRef.child("images/user/\(randomId)")
    }
}


