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
    
    var userInteracted = false {
        willSet {
            if newValue {
                self.startTimer()
            }
        }
    }
        
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionView
        collectionView.delegate = collectionView
        collectionView.parentVC = self
        autoScroll()
    }
    
    @objc private func autoScroll() {
        guard !userInteracted else {
            return
        }
        let offset = collectionView.contentOffset.x
        let newOffset = offset + 0.5
        //only want this to be called 30 times a second as this is all the screen can handle 0.033*30 = 1
        UIView.animate(withDuration: 0.033333, delay: 0, options: .curveEaseInOut, animations: { [weak self]() -> Void in
            self?.collectionView.contentOffset = CGPoint(x: newOffset, y: 0)
        }) { [weak self](finished) -> Void in
            self?.autoScroll()
        }
    }
    
    private func startTimer() {
        timer.invalidate()
        userInteracted = false
        timer = Timer(fireAt: Date() + 3, interval: 3, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: false)
        timer.fire()
    }
    
    @objc private func uiTouched() {
        userInteracted = true
    }
    
}
