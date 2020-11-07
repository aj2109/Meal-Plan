//
//  ViewController.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

class HomeViewController: UIViewController, Downloading {
    
    @IBOutlet weak var collectionView: DailyTeaserCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionView
        collectionView.delegate = collectionView
        autoScroll()
    }
    
    func autoScroll () {
        let offset = collectionView.contentOffset.x
        let newOffset = offset + 0.2
        UIView.animate(withDuration: 0.001, delay: 0, options: .curveEaseInOut, animations: { [weak self]() -> Void in
            self?.collectionView.contentOffset = CGPoint(x: newOffset, y: 0)
            }) { [weak self](finished) -> Void in
                self?.autoScroll()
        }
    }
    
}

