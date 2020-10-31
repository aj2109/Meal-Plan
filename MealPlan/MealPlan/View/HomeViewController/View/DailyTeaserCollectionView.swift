//
//  DailyTeaserCollectionView.swift
//  MealPlan
//
//  Created by Adam Jessop on 31/10/2020.
//

import UIKit

class DailyTeaserCollectionView: UICollectionView {
    
    var viewModel = DailyTeaserViewModel()
    
}

extension DailyTeaserCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}


extension HomeViewController: UICollectionViewDelegate {
    
}



