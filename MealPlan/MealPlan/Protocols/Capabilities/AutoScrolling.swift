//
//  AutoScrolling.swift
//  MealPlan
//
//  Created by Adam Jessop on 16/11/2020.
//

import UIKit

protocol AutoScrolling {
    
    var displayLink: CADisplayLink! { get set }
    var stopAutoScrolling: Bool { get set }
    
    func initiateAutoScroll() -> CADisplayLink
    func pauseAutoScroll()
    func resumeAutoScroll()
}

extension AutoScrolling where Self: UICollectionView {
    
    func initiateAutoScroll() -> CADisplayLink {
        let displayLink = CADisplayLink(target: self,selector: #selector(moveCollectionView))
        displayLink.add(to: RunLoop.current, forMode: RunLoop.Mode.default)
        return displayLink
    }
    
    func pauseAutomaticResumeScroll(completion: @escaping () -> ()) {
        pauseAutoScroll()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            self.resumeAutoScroll()
            completion()
        }
    }
    
    func pauseAutoScroll() {
        self.displayLink.isPaused = true
    }
    
    func resumeAutoScroll() {
        self.displayLink.isPaused = false
    }
    
}

fileprivate extension UICollectionView {
    
    @objc func moveCollectionView(displaylink: CADisplayLink) {
        let duration = displaylink.duration
        let offset = self.contentOffset.x
        let newOffset = Double(offset) + 10 * duration
        self.contentOffset = CGPoint(x: newOffset, y: 0)
    }
    
}
