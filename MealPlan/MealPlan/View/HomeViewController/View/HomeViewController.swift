//
//  ViewController.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

class HomeViewController: UIViewController, Downloading, Parsing {
    
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
        downloadContent(type: Data(), url: URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=c51d42f89ad84d37a4e8cf098d305fae&query=pasta&maxFat=25&number=7&addRecipeNutrition=true&addRecipeInformation")!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData) { (data, error) in
            guard let data = data, error == nil else {
                return
            }
            if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                print(json)
            }
//            parseData(type: _, data: data) { (parsedContents, error) in
//                <#code#>
//            }

        }
    }
    
}
