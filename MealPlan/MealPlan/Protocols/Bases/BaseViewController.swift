//
//  BaseViewController.swift
//  MealPlan
//
//  Created by Adam Jessop on 25/10/2020.
//

import UIKit

protocol BaseViewController: UIViewController, Customisable, Rotatable {
    
    var parentVC: UIViewController { get }
    
    var viewModel: BaseViewModel { get }
    
}
