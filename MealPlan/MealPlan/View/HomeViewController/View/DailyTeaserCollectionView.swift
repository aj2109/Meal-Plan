//
//  DailyTeaserCollectionView.swift
//  MealPlan
//
//  Created by Adam Jessop on 31/10/2020.
//

import UIKit

class DailyTeaserCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, AutoScrolling {

    var displayLink: CADisplayLink!
    
    var stopAutoScrolling: Bool = false {
        willSet {
            if newValue {
                pauseAutomaticResumeScroll {
                    self.stopAutoScrolling = false
                }
            }
        }
    }
    
    weak var weekViewModel: WeekViewModel?    
    weak var parentVC: HomeViewController?
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        displayLink = initiateAutoScroll()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.stopAutoScrolling = true
    }
    
}

extension DailyTeaserCollectionView: UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100000
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyTeaserCell", for: indexPath) as? DailyTeaserCollectionViewCell {
            guard
                let weekViewModel = weekViewModel,
                let model = weekViewModel.model,
                let day = model.days[indexPath.row % 7] as Day?,
                let dayName = day.dayName.rawValue as String?,
                let image = day.meals[Int.random(in: 0..<3)].image,
                let nutrients = day.nutrients else {
                return UICollectionViewCell()
            }
            cell.setup(image: image, dayName: dayName, nutrients: nutrients)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
