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
            var content: Content?
            do {
                content = try self.decodeData(data: data)
            } catch {
                print("REEEEE")
            }
            print("hi")
//            parseData(type: _, data: data) { (parsedContents, error) in
//                <#code#>
//            }
            print(content)
        }
    }
    
    func decodeData(data: Data) throws -> Content {
        return try JSONDecoder().decode(Content.self, from: data)
    }
    
}

struct Content: Decodable {
    
    public var results: [results]
    
    struct results: Decodable {
        
        var title: String
        var vegetarian: Bool
        var vegan: Bool
        var glutenFree: Bool
        var dairyFree: Bool
        var healthScore: Int
        var nutrition: nutrition
        
        struct nutrition: Decodable {
            
            var nutrients: [nutrients]
            var ingredients: [Ingredients]

            struct nutrients: Decodable {
                var title: String
                var amount: Double
                var unit: String
            }
            
            struct Ingredients: Decodable {
                var name: String
                var amount: Double
                var unit: String
            }
            
        }
    }
}
