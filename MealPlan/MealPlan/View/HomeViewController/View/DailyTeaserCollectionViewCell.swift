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
        iv.layer.cornerRadius = 15
        iv.clipsToBounds = true
        self.addSubview(iv)
        iv.contentMode = .scaleAspectFill
        iv.frame.size = self.frame.size
        return iv
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 25),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            label.widthAnchor.constraint(equalToConstant: self.frame.width / 2),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
        label.font = UIFont(name: "Poppins", size: 30)
        label.textColor = .black
        return label
    }()
    
    lazy var nutrientsTextView: UITextView = {
        let backgroundColorView = UIView()
        backgroundColorView.layer.cornerRadius = 15
        backgroundColorView.clipsToBounds = true
        self.addSubview(backgroundColorView)
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundColorView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundColorView.trailingAnchor.constraint(equalTo: self.imageview.trailingAnchor),
            backgroundColorView.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            backgroundColorView.heightAnchor.constraint(equalToConstant: self.frame.height / 2)
        ])
        backgroundColorView.backgroundColor = .lightGray
        backgroundColorView.alpha = 0.6
        
        let textView = UITextView()
        self.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textView.trailingAnchor.constraint(equalTo: self.imageview.trailingAnchor),
            textView.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: self.frame.height / 2)
        ])
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.showsVerticalScrollIndicator = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    func setup(image: UIImage, dayName: String, nutrients: Nutrients) {
        imageview.image = image
        dayLabel.text = dayName
        setupNutrients(nutrients: nutrients)
    }
    
    private func setupNutrients(nutrients: Nutrients) {
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSMutableAttributedString(string: "Calories: " + String(nutrients.calories), attributes: [NSAttributedString.Key.font : UIFont(name: "Poppins", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\n"))
        attributedText.append(NSMutableAttributedString(string: "Protein: " + String(nutrients.protein), attributes: [NSAttributedString.Key.font : UIFont(name: "Poppins", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\n"))
        attributedText.append(NSMutableAttributedString(string: "Carbs: " + String(nutrients.carbs), attributes: [NSAttributedString.Key.font : UIFont(name: "Poppins", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        attributedText.append(NSAttributedString(string: "\n"))
        attributedText.append(NSMutableAttributedString(string: "Fat: " + String(nutrients.fat), attributes: [NSAttributedString.Key.font : UIFont(name: "Poppins", size: 18)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
        nutrientsTextView.attributedText = attributedText
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageview.image = nil
        dayLabel.text = nil
        nutrientsTextView.attributedText = nil
    }
    
}
