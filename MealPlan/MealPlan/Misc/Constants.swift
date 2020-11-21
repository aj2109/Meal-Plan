//
//  Constants.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import Foundation

struct Constants {
    
    static let apiURL = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=c51d42f89ad84d37a4e8cf098d305fae&query=pasta&maxFat=25&number=\(numberOfDays*numberOfMealsADay)&addRecipeNutrition=true&addRecipeInformation")!
    static let numberOfDays = 7
    static let numberOfMealsADay = 3

    
}
