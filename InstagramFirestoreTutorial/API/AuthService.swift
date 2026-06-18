//
//  AuthService.swift
//  InstagramFirestoreTutorial
//
//  Created by Nathaniel Faxon on 6/10/26.
//

import UIKit
import Firebase
import FirebaseAuth

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static func logUserIn(withEmail email: String, password: String, completion: ((AuthDataResult?, Error?) -> Void)?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
    
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) {
                (result, error) in
                
                if let error = error {
                    print("Debug: Failed to register user \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                
                let data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname,
                                           "username": credentials.username,
                                           "profileImageUrl": imageUrl,
                                           "uid": uid]
                
                COLLECTION_USERS.document(uid).setData(data, completion: completion)
            }
        }
    }
    
}
