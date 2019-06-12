//
//  user.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/15/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import Foundation

class User {
    var userID: String
    var userName: String
    var fullName: String
    var profilePhotoUrl: String?
    var email: String
    var bio: String?
    var followers: Int
    var following: Int
    
    init(userID: String = NSUUID().uuidString, userName: String, fullName: String, profilePhotoUrl: String? = nil, email: String, bio: String? = nil, followers: Int = 0, following: Int = 0) {
        self.userID = userID
        self.userName = userName
        self.fullName = fullName
        self.profilePhotoUrl = profilePhotoUrl
        self.email = email
        self.bio = bio
        self.followers = followers
        self.following = following
    }
}
