//
//  Post.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/15/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import Foundation
class Post {
    var userID: String
    var photoUrl: String
    var postID: String
    var likes: Int
    var caption: String?
    
    init(userID: String, photoUrl: String, postID: String = NSUUID().uuidString, likes: Int = 0, caption: String? = nil) {
        self.userID = userID
        self.photoUrl = photoUrl
        self.postID = postID
        self.likes = likes
        self.caption = caption
    }
}

