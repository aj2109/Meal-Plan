//
//  WeekViewModel.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import Foundation

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
        //setupData must have been called prior to this point
        guard hasNotPassedAWeek else {
            //SHOULD BE PULLING DATA FROM PERSISTENT STORAGE (Core Data?) if this is the case here. prob do an offline check too
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
    
    private func setupMealsForEachDay(meals: [Meal]) {
        //perform logic for putting foods into specific days, then combine them with the correct dayName:
        // self.mealsForEachDay[DayName.Monday.rawValue] = X meal
        //once finished should be able to call instaniateWeek?
    }
    
    
    private func setupData(completion: @escaping (_ success: Bool)->()) {
        downloadContent(type: Data(), url: URL(fileURLWithPath: "exampleURL"), cachePolicy: .reloadRevalidatingCacheData) { (data, error) in
            guard error == nil else {
                return
            }
            //parseContent
            //create a pool of foods that can be used
            //create a pool of meals that can be used
            //setupMealsForEachDay()
            //complete
        }
    }
    
    
}


