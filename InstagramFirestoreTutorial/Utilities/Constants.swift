//
//  Constants.swift
//  InstagramFirestoreTutorial
//
//  Created by Nathaniel Faxon on 6/17/26.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")

let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")

let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
