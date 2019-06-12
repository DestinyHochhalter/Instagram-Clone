//
//  PostCell.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/15/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit
import Kingfisher

protocol PostCellDelegate {
    func delegateCheeseTapped(cell: PostCell)
    func delegateUserTapped(cell: PostCell)
}
class PostCell: UITableViewCell {
        
    // Outlets
    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var moreImgView: UIImageView!
    @IBOutlet weak var postImgView: UIImageView!
    @IBOutlet weak var cheeseImgView: UIImageView!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var captionLbl: UILabel!
    @IBOutlet weak var heartImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        heartImgView.alpha = 0
    }
    
    var delegate: PostCellDelegate?
    // set up each post from the posts array
    // ex: posts[2]
    
    func clearData(model: Post) {
        captionLbl.text = ""
        usernameLbl.text = ""
    }
    
    // 1. create a tap gesture
    // 2. add the tap gesture to the ui element (cheese imageview)
    // 3. set the isUserInteractionEnabled of the ui element to true
    // 4. create a function (selector) when the tap gesture is triggered
    
    // Gestures
    func addGestures() {
        let cheeseTapGesture = UITapGestureRecognizer(target: self, action: #selector(cheeseTapped))
        cheeseTapGesture.numberOfTapsRequired = 1
        cheeseImgView.addGestureRecognizer(cheeseTapGesture)
        cheeseImgView.isUserInteractionEnabled = true
        
        let userNameLblTapGesture = UITapGestureRecognizer(target: self, action: #selector(userTapped))
        userNameLblTapGesture.numberOfTapsRequired = 1
        usernameLbl.addGestureRecognizer(userNameLblTapGesture)
        usernameLbl.isUserInteractionEnabled = true
        
        let userImgTapGesture = UITapGestureRecognizer(target: self, action: #selector(userTapped))
        userImgTapGesture.numberOfTapsRequired = 1
        userImgView.addGestureRecognizer(userImgTapGesture)
        userImgView.isUserInteractionEnabled = true
        
        let postImgTapGesture = UITapGestureRecognizer(target: self, action: #selector(postImgDoubleTapped))
        postImgTapGesture.numberOfTapsRequired = 2
        postImgView.addGestureRecognizer(postImgTapGesture)
        postImgView.isUserInteractionEnabled = true
        
    }
    
    func animateCheese() {
        let isLiked = cheeseImgView.image == UIImage(named: "cheeseLike")!
        if isLiked {
            cheeseImgView.pulse(duration: 0.2, newImage: "cheese", scale: 1.1)
        } else {
            cheeseImgView.pulse(duration: 0.2, newImage: "cheeseLike", scale: 1.1)
        }
    }
    
     // add @objc for uigestures
    func animateHeart() {
        // 1. fade in and scale heart from size A to B
        // 2. scale heart to size C
        // 4. fade out heart and shrink to A
        UIView.animate(withDuration: 0.35, animations: {
            // 1. fade in and scale heart from size A to B
            self.heartImgView.alpha = 1
            // scale the size
            self.heartImgView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (_) in
            // 2. scale heart to size C
            UIView.animate(withDuration: 0.1, animations: {
                self.heartImgView.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            }, completion: { (_) in
                // 3. fade out heart and shrink to A
                UIView.animate(withDuration: 0.2, delay: 0.2, options: [], animations: {
                    // original size is identity
                    self.heartImgView.transform = .identity
                    self.heartImgView.alpha = 0
                }, completion: nil)
            })
        }
    }
    
    @objc func postImgDoubleTapped() {
        animateHeart()
        delegate?.delegateCheeseTapped(cell: self)
    }
    @objc func userTapped() {
        delegate?.delegateUserTapped(cell: self)
    }
   
    @objc func cheeseTapped() {
        animateCheese()
        delegate?.delegateCheeseTapped(cell: self)
    }
    
    func setup(model: Post) {
        addGestures()
        clearData(model: model)
        // we have the userId of the post. we want to get the user data from that userId. we have to iterate over the users array and find the user that has the post's userId. Then we can get that user's info (username, bio, etc)
//        for user in Data.users {
//            if user.userID == model.userID {
//                // we found the user that made this post!
//                usernameLbl.text = user.userName
//                if let profilePhotoUrl = user.profilePhotoUrl {
//                    userImgView.kf.setImage(with: URL(string: profilePhotoUrl))
//                }
//
//            }
//        }
        
        // -- Populate User Data
        // filter will return a bool if satisfied - combined with compactMap{$0} or flatMap will return the object that satisfies.
        if let user = getUser(id: model.userID) {
            usernameLbl.text = user.userName
            if let profilePhotoUrl = user.profilePhotoUrl {
                userImgView.kf.setImage(with: URL(string: profilePhotoUrl))
            }
        }
        
        // -- Populate Post Data
        likesLbl.text = "\(model.likes) likes"
        if let caption = model.caption {
            captionLbl.text = caption
        }
        if let photoUrl = URL(string: model.photoUrl) {
            postImgView.kf.setImage(with: photoUrl)
        }
    }
}
