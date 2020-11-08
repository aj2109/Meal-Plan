//
//  DailyTeaserCollectionView.swift
//  MealPlan
//
//  Created by Adam Jessop on 31/10/2020.
//

import UIKit

class DailyTeaserCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    var viewModel = DailyTeaserViewModel()
        
    var temporaryImageArray: [UIImage] = [#imageLiteral(resourceName: "Meal7"),#imageLiteral(resourceName: "Meal5"),#imageLiteral(resourceName: "Meal1"),#imageLiteral(resourceName: "Meal3"),#imageLiteral(resourceName: "Meal4"),#imageLiteral(resourceName: "Meal3"),#imageLiteral(resourceName: "Meal6"),#imageLiteral(resourceName: "Meal3")]
    var temporaryDayNameArray: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var temporaryMealList: [String] = []
    var temporaryNutrients: [Nutrients] = [Nutrients(carbs: 200, fat: 80, protein: 100, calories: 2400), Nutrients(carbs: 220, fat: 90, protein: 110, calories: 2500), Nutrients(carbs: 190, fat: 90, protein: 100, calories: 2384), Nutrients(carbs: 200, fat: 80, protein: 100, calories: 2400), Nutrients(carbs: 220, fat: 90, protein: 110, calories: 2500), Nutrients(carbs: 190, fat: 90, protein: 100, calories: 2384), Nutrients(carbs: 200, fat: 80, protein: 100, calories: 2400)]
    
    weak var parentVC: HomeViewController?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.parentVC?.userInteracted = true
    }
    
}

extension DailyTeaserCollectionView: UICollectionViewDataSource {
    
    //data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100000
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyTeaserCell", for: indexPath) as? DailyTeaserCollectionViewCell {
            cell.setup(image: temporaryImageArray[indexPath.row % 7], dayName: temporaryDayNameArray[indexPath.row % 7], nutrients: temporaryNutrients[indexPath.row % 7
            ])
            print(indexPath.row)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
