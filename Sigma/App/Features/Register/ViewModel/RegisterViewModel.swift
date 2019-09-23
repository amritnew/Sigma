//
//  RegisterViewModel.swift
//  Sigma
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import FirebaseAuth

struct RegisterViewModel {
    
    let firebaseAuth = Auth.auth()
    
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
}


