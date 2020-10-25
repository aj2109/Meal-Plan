//
//  Day.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

struct Day: BaseModel {
    
    var meals: [Meal]
    var nutrients: Nutrients
    var dayName: String
    
}
