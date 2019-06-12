//
//  CircleView.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/17/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        layer.cornerRadius = frame.size.width / 2.0
        clipsToBounds = true
        layer.borderColor = UIColor.groupTableViewBackground.cgColor
        layer.borderWidth = 2
        
    }
}
