//
//  ConvenienceModels.swift
//  MealPlan
//
//  Created by Adam Jessop on 21/11/2020.
//

import Foundation

struct Nutrients {
    
    var carbohydrates: Double
    var fat: Double
    var protein: Double
    var calories: Double
    var saturdatedFat: Double
    var sugar: Double
    var sodium: Double
    
}

enum DayName: String, CaseIterable {
   
    typealias RawValue = String
    
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
}
