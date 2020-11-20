//
//  Meal.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

struct Meal: BaseModel {
 
    var name: String
    var nutrients: Nutrients
    var image: UIImage
    var description: String

}

struct Nutrients {
    
    var calories: Double
    var carbohydrates: Double
    var fat: Double
    var protein: Double
    var saturdatedFat: Double
    var sugar: Double
    var sodium: Double
    
}
