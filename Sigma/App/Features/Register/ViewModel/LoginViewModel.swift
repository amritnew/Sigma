//
//  LoginViewModel.swift
//  Sigma
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import FirebaseAuth

struct LoginViewModel {
    
    let firebaseAuth = Auth.auth()
    
    func loginAuth(withEmail email: String?, withPassword password: String?, completion: @escaping (Bool) -> ()) {
        guard let userEmail = email, let userPassword = password else {
            return completion(false)
        }
        
        firebaseAuth.signIn(withEmail: userEmail, password: userPassword) { (result, error) in
            if error != nil {
                completion(false)
            }
            completion(true)
        }
    }
}
