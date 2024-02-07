//
//  MealPlannerFeatureViewController.swift
//  CoursesUDemo
//
//  Created by Diarmuid McGonagle on 07/02/2024.
//

import UIKit
import MealzNavModuleIOS

class MealPlannerFeatureViewController: UINavigationController {

    var rootCoordinator: MealPlannerFeatureNavCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coordinator = MealPlannerFeatureNavCoordinator(
            baseConstructor: MealzBaseNavCoordinator.Constructor(
                navigationController: self
            ),
            recipeDetailsConstructor: MealzViewConfig.recipeDetailsConfig,
            mealPlannerFeatureConstructor: MealzViewConfig.mealPlannerConfig)
        
        self.rootCoordinator = coordinator
        self.rootCoordinator?.showMealPlannerForm()
        
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
