//
//  Funcs.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/17/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit

func getUser(id: String) -> User? {
    if let user = Data.users.filter({$0.userID == id}).compactMap({$0}).first {
        return user
    }
    return nil
}
