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
    
    init() {
        setup()
    }
    
    private func setup() {
        self.setupData(completion: { days, meals  in
            self.instantiateWeek(days: days, meals: meals)
        })
    }
    
    private func setupData(completion: @escaping (_ days: [Day], _ totalMeals: [Meal])->()) {
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
            self.instantiateMealsForEachDay(results: results) { meals in
                var days: [Day] = []
                for i in 0..<Constants.numberOfDays {
                    let meals = Array(meals[i*Constants.numberOfMealsADay..<(i*Constants.numberOfMealsADay)+(Constants.numberOfMealsADay)])
                    days.append(Day(meals: meals,
                                    nutrients: self.workoutTotalNutrients(meals: meals),
                                    dayName: DayName.allCases[i])) //need to make this switch over if needed, use modulus?
                }
                completion(days, meals)
            }
        }
    }
    
    private func instantiateMealsForEachDay(results: [ParsedResult], completion: @escaping ([Meal])->()) {
        var meals: [Meal] = [] {
            didSet {
                if meals.count == Constants.numberOfMealsADay * Constants.numberOfDays {
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

    }
    
    private func workoutTotalNutrients(meals: [Meal]) -> Nutrients {
        var nutrients = Nutrients(carbohydrates: 0, fat: 0, protein: 0, calories: 0, saturdatedFat: 0, sugar: 0, sodium: 0)
        meals.forEach({ (meal) in
            nutrients.calories += meal.nutrients.calories
            nutrients.carbohydrates += meal.nutrients.carbohydrates
            nutrients.fat += meal.nutrients.fat
            nutrients.protein += meal.nutrients.protein
            nutrients.saturdatedFat += meal.nutrients.saturdatedFat
            nutrients.sugar += meal.nutrients.sugar
            nutrients.sodium += meal.nutrients.sodium
        })
        return nutrients
    }
    
    private func instantiateWeek(days: [Day], meals: [Meal]) {
        //TODO: deal with checking if a week has passed here (though could be manually forced refresh too so should be param)
        //TODO work out beginning of weeks date, and probably add an end date?
        let week = Week(days: days, nutrients: workoutTotalNutrients(meals: meals), date: Date())
        dump(week)
    }
        
}
