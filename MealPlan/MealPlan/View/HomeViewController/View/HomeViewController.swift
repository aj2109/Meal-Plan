//
//  ViewController.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

class HomeViewController: UIViewController, Downloading {
    
    @IBOutlet weak var collectionView: DailyTeaserCollectionView!
    
    @IBOutlet weak var collectionViewContainerView: UIView!
    
    var userInteracted = false
    
    var lastTimestamp = TimeInterval()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionView
        collectionView.delegate = collectionView
        collectionView.parentVC = self
        autoScroll()
    }
    
    @objc private func autoScroll() {
        let displaylink = CADisplayLink(target: self,selector: #selector(moveCollectionView))
        displaylink.add(to: .current, forMode: .default)
    }
    
    @objc func moveCollectionView(displaylink: CADisplayLink) {
        guard !userInteracted else {
            DispatchQueue.global().asyncAfter(deadline: .now() + 4) { 
                self.userInteracted = false
            }
            return
        }
        
        let duration = displaylink.duration
        print("elapsed time: \(duration)")
        
        self.lastTimestamp = displaylink.timestamp

        let offset = self.collectionView.contentOffset.x
        let newOffset = Double(offset) + 10 * duration
        print("new offset: \(newOffset)")
        self.collectionView.contentOffset = CGPoint(x: newOffset, y: 0)
    }
    
}
