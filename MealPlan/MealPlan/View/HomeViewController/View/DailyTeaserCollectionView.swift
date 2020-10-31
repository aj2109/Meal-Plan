//
//  DailyTeaserCollectionView.swift
//  MealPlan
//
//  Created by Adam Jessop on 31/10/2020.
//

import UIKit

class DailyTeaserCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    var viewModel = DailyTeaserViewModel()
    
    var temporaryImageArray: [UIImage] = [#imageLiteral(resourceName: "Meal4"),#imageLiteral(resourceName: "Meal5"),#imageLiteral(resourceName: "Meal1"),#imageLiteral(resourceName: "Meal3"),#imageLiteral(resourceName: "Meal4"),#imageLiteral(resourceName: "Meal3"),#imageLiteral(resourceName: "Meal6"),#imageLiteral(resourceName: "Meal3")]
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hi")
        
    }
}

extension DailyTeaserCollectionView: UICollectionViewDataSource {
    
    //data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyTeaserCell", for: indexPath) as? DailyTeaserCollectionViewCell {
            cell.setup(image: temporaryImageArray[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


