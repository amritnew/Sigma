//
//  FireAccess.swift
//  Sigma
//
//  Created by aluno on 25/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import FirebaseAuth
/// Adapter to firebase access, all methods at 'struct' has responsible to control access at Firebase
struct FireAccess {
    //Method verify if user is current logged, if not make something.
    static func isLogged() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
}
