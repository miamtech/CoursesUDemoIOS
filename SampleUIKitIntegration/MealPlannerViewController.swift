//
//  MealPlannerViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUIOSTemplate

class MealPlannerViewController: UIHostingController<BudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>> {
    
    required init?(coder aDecoder: NSCoder) {
        let budgetPlannerView = BudgetPlannerView.init(toolbarTemplate: CoursesUBudgetPlannerToolbar(), footerTemplate: CoursesUBudgetPlannerFooter(), recipeCardTemplate: CoursesUBudgetRecipeCard(), loadingCardTemplate: CoursesUBudgetRecipeCardLoading(), placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(), recipes: ["123","32","232"], selectedRecipe: .constant("123"), showRecipe: {_ in}, validateRecipes: {}, replaceRecipe: {_ in})
        super.init(coder: aDecoder, rootView: budgetPlannerView)
    }
    
    override init(rootView: BudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let budgetPlannerView = BudgetPlannerView.init(toolbarTemplate: CoursesUBudgetPlannerToolbar(), footerTemplate: CoursesUBudgetPlannerFooter(), recipeCardTemplate: CoursesUBudgetRecipeCard(), loadingCardTemplate: CoursesUBudgetRecipeCardLoading(), placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(), recipes: ["123","32","232"], selectedRecipe: .constant("123"), showRecipe: {_ in}, validateRecipes: {}, replaceRecipe: {_ in})
        super.init(rootView: budgetPlannerView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
