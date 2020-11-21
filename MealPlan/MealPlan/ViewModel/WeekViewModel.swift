//
//  WeekViewModel.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

class WeekViewModel: Downloading, Parsing {
    
    private var dayViewModels: [DayViewModel]!
    private var model: Week!
    private var mealsForEachDay: [DayName:[Meal]]!
    private var hasNotPassedAWeek: Bool {
        return true //put in logic to check if its been a week since we last produced a meal plan
    }
    
    init() {
        setup()
    }
    
    private func setup() {
        self.setupData(completion: { success in
            guard success else {
                fatalError("We've got no data :(")
            }
            self.instantiateWeek()
        })
    }
    
    private func instantiateWeek() {
        guard hasNotPassedAWeek else {
            return
        }
        guard let _ = self.mealsForEachDay else {
            fatalError("We should have this by now!")
        }
        var dayVMs: [DayViewModel] = []
        for day in mealsForEachDay {
            let dayVM = DayViewModel(meals: day.value, dayName: day.key)
            dayVMs.append(dayVM)
        }
        self.dayViewModels = dayVMs
    }
    
    private func setupData(completion: @escaping (_ success: Bool)->()) {
        downloadContent(type: Data(), url: Constants.apiURL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData) { (data, error) in
            guard let data = data, error == nil else {
                fatalError("No data from, or error (\(String(describing: error))) with, downloading!")
            }
            var content: Content?
            do {
                content = try JSONDecoder().decode(Content.self, from: data)
            } catch {
                fatalError("Can't decode the feed!")
            }
            guard let results = content?.results else {
                fatalError("No results from the decoded feed!")
            }
            self.instantiateMealsForEachDay(results: results) {meals in
               
            }
        }
    }
    
    private func instantiateMealsForEachDay(results: [ParsedResult], completion: @escaping ([Meal])->()) {
        var meals: [Meal] = [] {
            didSet {
                if meals.count == 7 {
                    completion(meals)
                }
            }
        }
        for result in results {
            var nutrients = Nutrients(carbohydrates: 0, fat: 0, protein: 0, calories: 0, saturdatedFat: 0, sugar: 0, sodium: 0)
            result.nutrition.nutrients.forEach({ current in
                let value = current.amount
                switch current.title.lowercased() {
                case "calories": nutrients.calories = value
                case "fat": nutrients.fat = value
                case "saturated fat": nutrients.saturdatedFat = value
                case "carbohydrates": nutrients.carbohydrates = value
                case "protein": nutrients.protein = value
                case "sugar": nutrients.sugar = value
                case "sodium": nutrients.sodium = value
                default: break
                }
            })
            guard let url = URL(string: result.image) else {
                meals.append(Meal(name: result.title, nutrients: nutrients, image: nil, description: result.summary))
                continue
            }
            self.downloadContent(type: UIImage(), url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, completion: { (image, error) in
                meals.append(Meal(name: result.title, nutrients: nutrients, image:
                                    image ?? nil, description: result.summary))
            })
        }
        
        //perform logic for putting foods into specific days, then combine them with the correct dayName:
        // self.mealsForEachDay[DayName.Monday.rawValue] = X meal
        //once finished should be able to call instaniateWeek?
    }
        
}
