//
//  Week.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import Foundation

struct Week: BaseModel {
    
    var days: [Day]
    var nutrients: Nutrients
    var date: Date
    
}
