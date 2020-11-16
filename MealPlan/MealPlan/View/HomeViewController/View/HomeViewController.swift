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
    @IBOutlet weak var bottomViewContainer: UIView!
    
    var userInteracted = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionView
        collectionView.delegate = collectionView
        collectionView.parentVC = self
        bottomViewContainer.curveEdges(edges: [.layerMinXMinYCorner, .layerMaxXMinYCorner], cornerRadius: 200)
        view.gradientBackground(firstColor: UIColor.purple, secondColour: self.view.backgroundColor!)
    }
    
}
