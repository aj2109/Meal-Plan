//
//  Meal.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

struct Meal: BaseModel {
 
    var foods: [Food]
    var name: String
    var nutrients: Nutrients
    var image: UIImage
    var description: String

}

struct Nutrients {
    
    var carbs: Int
    var fat: Int
    var protein: Int
    var calories: Int
    
}
