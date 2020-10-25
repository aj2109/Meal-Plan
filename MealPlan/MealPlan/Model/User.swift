//
//  User.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

struct User: BaseModel {
    
    var day: Week
    var currentDay: Day
    var personalInfo: PersonalInformation
    
}

struct PersonalInformation {
    
    var name: String
    var height: Int
    var weight: Int
    var targetCalories: Int
    
}
