//
//  ProfileHeaderViewModel.swift
//  InstagramFirestoreTutorial
//
//  Created by Nathaniel Faxon on 6/22/26.
//

import Foundation

struct ProfileHeaderViewModel {
    let user: User
    
    var fullName: String {
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
