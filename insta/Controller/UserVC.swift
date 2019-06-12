//
//  UserVC.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/17/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit
import Kingfisher

class UserVC: UIViewController {
    
    @IBOutlet weak var backImgView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var moreLbl: UIImageView!
    @IBOutlet weak var userProfileImgView: CircleImgView!
    @IBOutlet weak var userFullNameLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    
    var passedUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addGestures()
    }
    
    func setupUI() {
        if let user = passedUser {
            userNameLbl.text = user.userName
            if let url = user.profilePhotoUrl { userProfileImgView.kf.setImage(with: URL(string: url))
            }
            userFullNameLbl.text = user.fullName
            if let bio = user.bio {
                bioLbl.text = bio
            } else {
                bioLbl.text = nil
            }
        }
    }
    
    func addGestures() {
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        backImgView.isUserInteractionEnabled = true
        backImgView.addGestureRecognizer(backTap)
    }
    
    @objc func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
