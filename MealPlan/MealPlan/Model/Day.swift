//
//  Day.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

struct Day: BaseModel {
    
    var meals: [Meal]
    var nutrients: Nutrients?
    var dayName: DayName
    
}


enum DayName: String {
    
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
}
