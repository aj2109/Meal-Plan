//
//  BaseViewModel.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

protocol BaseViewModel {
    
    var model: BaseViewModel { get }
    var viewController: BaseViewController { get set }
    
}
