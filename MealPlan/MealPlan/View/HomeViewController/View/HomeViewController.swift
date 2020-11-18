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
            do {
                try self.decodeData(data: data)
            } catch {
                print("REEEEE")
            }
//            parseData(type: _, data: data) { (parsedContents, error) in
//                <#code#>
//            }

        }
    }
    
    func decodeData(data: Data) throws {
        let json = try JSONDecoder().decode(Content.self, from: data)
        print(json)
    }
    
}

struct Content: Decodable {
    
    public var results: [Result]
    
    struct Result: Decodable {
        
        var vegetarian: Bool
        var vegan: Bool
        var glutenFree: Bool
        var dairyFree: Bool
        var healthScore: Int
        var nutrition: Nutrition
        
        struct Nutrition: Decodable {
            
            var nutrients: Nutrients
            var ingredients: [Ingredients]
            
            struct Nutrients: Decodable {
                enum CodingKeys: String, CodingKey, Decodable {
                    case calories = "Calories"
                    case fat = "Fat"
                    case saturatedFat = "Saturated Fat"
                    case carbohydrates = "Carbohydrates"
                    case sugar = "Sugar"
                    case salt = "Sodium"
                    case fibre = "Fibre"
                }
                var calories: Int
                var fat: Int
                var saturatedFat: Int
                var carbohydrates: Int
                var sugar: Int
                var salt: Int
                var fibre: Int
            }
            
            struct Ingredients: Decodable {
                var name: String
                var amount: Double
                var unit: String
            }
            
        }
    }
}




struct A {
    struct Week {
        struct Day {
            struct Meal {
                struct Food {
                    var name: String
                    var quantity: Int = 1
                    var avoided: Bool
                    var allergies: Allergies
                }
                var foods: [Food]
                var name: String
                var nutrients: Nutrients
                var image: UIImage
                var description: String
            }
            var meals: [Meal]
            var nutrients: Nutrients?
            var dayName: DayName
        }
        var days: [Day]
        var nutrients: Nutrients
        var date: Date
    }
}

enum Allergies {
    case vegetarian
    case vegan
    case glutenFree
}
