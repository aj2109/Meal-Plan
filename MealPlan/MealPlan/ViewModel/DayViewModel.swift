//
//  DayViewModel.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

struct DayViewModel {
    
    private var day: Day

    init(meals: [Meal], dayName: DayName) {
        self.day = Day(meals: meals, dayName: dayName)
        self.day.nutrients = workoutNutrients()
    }
    
    private func workoutNutrients() -> Nutrients? {
        return Nutrients(carbs: 0, fat: 0, protein: 0, calories: 0) //write some shiz
    }
    
}
