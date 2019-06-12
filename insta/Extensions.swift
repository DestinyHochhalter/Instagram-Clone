//
//  Extensions.swift
//  insta
//
//  Created by Destiny Hochhalter on 2/16/19.
//  Copyright © 2019 Destiny Hochhalter. All rights reserved.
//

import UIKit

extension UIImageView {
    func getHeight(parentWidth: CGFloat) -> CGFloat? {
        if let image = self.image {
            let widthRatio = self.bounds.size.width / image.size.width
            let heightRatio = self.bounds.size.height / image.size.height
            let scale = min(widthRatio, heightRatio)
            let imageWidth = scale * image.size.width
            let imageHeight = scale * image.size.height
            return (imageHeight * parentWidth) / imageWidth
        }
        return nil
    }
    
    func pulse(duration: TimeInterval, newImage: String?, scale: CGFloat) {
        UIView.animate(withDuration: duration / 2.0, animations: {
            if let newImage = newImage {
                self.image = UIImage(named: newImage)!
            }
            self.transform = CGAffineTransform(scaleX: scale, y: scale)
        }) { (_) in
            UIView.animate(withDuration: duration / 2.0, animations: {
                self.transform = .identity
            }, completion: nil)
        }
    }
}
