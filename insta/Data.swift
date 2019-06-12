//
//  Data.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/15/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import Foundation

enum Users {
    static let Destiny = User(userName: "Destiny", fullName: "Destiny Hochhalter", profilePhotoUrl:
        "https://wandeleur.com/wp-content/uploads/2015/10/barely-there-makeup-french.jpg", email: "destiny@gmail.com", bio: "basic")
    static let Forrest = User(userName: "Forrest", fullName: "Forrest Collins", profilePhotoUrl:
        "http://secretsofagoodgirl.com/wp-content/uploads/2013/01/pierre.jpg", email: "forrest@gmail.com", bio: "Rats are mans best friend")
}

enum Posts {
    static let _1 = Post(userID: Users.Destiny.userID, photoUrl: "https://images.unsplash.com/photo-1474626575059-17c42b4e7bd0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80", caption: "I love rats :)")
    static let _2 = Post(userID: Users.Destiny.userID, photoUrl: "https://images.unsplash.com/photo-1510833606101-ca2953c586a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80", caption: "Found my son the other day digging through the trash. I raised him like his father.")
    static let _3 = Post(userID: Users.Forrest.userID, photoUrl: "https://images.unsplash.com/photo-1516025455112-e73ad04772e8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80", caption: "PiggiePigPigs!")
    static let _4 = Post(userID: Users.Destiny.userID, photoUrl: "https://cdn.pixabay.com/photo/2016/12/19/17/41/rat-1918709_1280.jpg")
    static let _5 = Post(userID: Users.Forrest.userID, photoUrl: "https://www.geekfill.com/wp-content/uploads/2015/08/Just-the-happiest-cookie-eating-rat-ever.jpg",caption: "So I was cooking with my son Rathew this morning, and he couldn't help but eat all the cookies. Now there are no cookies left! :( ")
}

enum Data {
    static let users = [Users.Destiny, Users.Forrest]
    static let posts = [Posts._1, Posts._2, Posts._3, Posts._4, Posts._5]
}
