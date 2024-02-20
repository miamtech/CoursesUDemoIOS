//
//  MealPlannerFeatureViewController.swift
//  CoursesUDemo
//
//  Created by Diarmuid McGonagle on 07/02/2024.
//

import UIKit
import MealzNavModuleIOS

class MealPlannerFeatureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mealPlannerFeature = MealzMealPlannerFeatureUIKit(
            recipeDetailsConstructor: MealzViewConfig.recipeDetailsConfig,
            mealPlannerFeatureConstructor: MealzViewConfig.mealPlannerConfig
        )
        
        // Add the custom navigation controller as a child view controller
        addChild(mealPlannerFeature)
        mealPlannerFeature.view.frame = self.view.bounds
        view.addSubview(mealPlannerFeature.view)
        mealPlannerFeature.didMove(toParent: self)
    }
}


// i only use above because i want to use Storyboard
//let mealPlannerFeature = MealzMealPlannerFeatureUIKit(
//    recipeDetailsConstructor: MealzViewConfig.recipeDetailsConfig,
//    mealPlannerFeatureConstructor: MealzViewConfig.mealPlannerConfig
//)
