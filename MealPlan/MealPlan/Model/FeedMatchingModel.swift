//
//  ParsingModel.swift
//  MealPlan
//
//  Created by Adam Jessop on 21/11/2020.
//

import Foundation

// Feed-matching parsing model, to turn into a useful structure

struct Content: Decodable {
    
    public var results: [results]
    
    struct results: Decodable {
        
        var title: String
        var summary: String
        var image: String
        var vegetarian: Bool
        var vegan: Bool
        var glutenFree: Bool
        var dairyFree: Bool
        var healthScore: Int
        var nutrition: nutrition
        
        struct nutrition: Decodable {
            
            var nutrients: [nutrients]
            var ingredients: [Ingredients]
            
            struct nutrients: Decodable {
                var title: String
                var amount: Double
                var unit: String
            }
            
            struct Ingredients: Decodable {
                var name: String
                var amount: Double
                var unit: String
            }
        }
    }
}

typealias ParsedResult = Content.results
