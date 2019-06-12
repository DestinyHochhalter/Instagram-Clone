//
//  CircleImgView.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/16/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit


class CircleImgView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = frame.size.width / 2.0
        clipsToBounds = true
        contentMode = .scaleAspectFill
        
        
    }

}
