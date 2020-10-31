//
//  DailyTeaserCollectionViewCell.swift
//  MealPlan
//
//  Created by Adam Jessop on 31/10/2020.
//

import UIKit

class DailyTeaserCollectionViewCell: UICollectionViewCell {
    
    var imageview: UIImageView?
    
    func setup(image: UIImage) {
        imageview = UIImageView()
        guard let imageview = imageview else {
            return
        }
        self.addSubview(imageview)
        imageview.image = image
        imageview.frame = self.frame
        print(imageview)
        print(imageview.image)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageview?.image = nil
        self.imageview?.removeFromSuperview()
        imageview = nil
    }
    
}

//
////
////  DailyTeaserCollectionViewCell.swift
////  MealPlan
////
////  Created by Adam Jessop on 31/10/2020.
////
//
//import UIKit
//
//class DailyTeaserCollectionViewCell: UICollectionViewCell {
//
//    lazy var imageview: UIImageView? = {
//        let iv = UIImageView()
//        self.addSubview(iv)
////        iv.translatesAutoresizingMaskIntoConstraints = false
////        NSLayoutConstraint.activate([
////            iv.topAnchor.constraint(equalTo: self.topAnchor),
////            iv.bottomAnchor.constraint(equalTo: self.bottomAnchor),
////            iv.leadingAnchor.constraint(equalTo: self.leadingAnchor),
////            iv.trailingAnchor.constraint(equalTo: self.trailingAnchor)
////        ])
//        iv.frame = self.frame
//        return iv
//    }()
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageview?.image = nil
//        imageview = nil
//        self.imageview?.removeFromSuperview()
//    }
//
//}
