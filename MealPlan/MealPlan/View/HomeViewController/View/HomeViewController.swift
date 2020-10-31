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
    }
    
}

