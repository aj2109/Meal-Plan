//
//  Preferences.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

struct Preferences: BaseModel {
    
    var avoidedFoods: [Food]
    var avoidedMeals: [Meal]
    var recentlyUsedMeals: [Meal]
    
}
