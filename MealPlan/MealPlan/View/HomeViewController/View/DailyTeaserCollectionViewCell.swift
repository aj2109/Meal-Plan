//
//  DailyTeaserCollectionViewCell.swift
//  MealPlan
//
//  Created by Adam Jessop on 31/10/2020.
//

import UIKit

class DailyTeaserCollectionViewCell: UICollectionViewCell {
    
    lazy var imageview: UIImageView = {
        let iv = UIImageView()
        self.addSubview(iv)
        iv.contentMode = .scaleAspectFill
        iv.frame.size = self.frame.size
        return iv
    }()
    
    func setup(image: UIImage) {
        imageview.image = image
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageview.image = nil
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
