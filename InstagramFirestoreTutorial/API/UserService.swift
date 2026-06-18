//
//  UserService.swift
//  InstagramFirestoreTutorial
//
//  Created by Nathaniel Faxon on 6/16/26.
//

import Firebase
import FirebaseAuth

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { (snapshot, error) in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
        }
    }
}
