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

class MealPlannerViewController: UIHostingController<CoursesUBudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>> {
    
    required init?(coder aDecoder: NSCoder) {
        let budgetPlannerView = CoursesUBudgetPlannerView.init(toolbarTemplate: CoursesUBudgetPlannerToolbar(), recipeCardTemplate: CoursesUBudgetRecipeCard(), loadingCardTemplate: CoursesUBudgetRecipeCardLoading(), placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(), recipes: ["123","32","232"], validateRecipes: {}, replaceRecipe: {_ in})
        super.init(coder: aDecoder, rootView: budgetPlannerView)
    }
    
    override init(rootView: CoursesUBudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let budgetPlannerView = CoursesUBudgetPlannerView.init(toolbarTemplate: CoursesUBudgetPlannerToolbar(), recipeCardTemplate: CoursesUBudgetRecipeCard(), loadingCardTemplate: CoursesUBudgetRecipeCardLoading(), placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(), recipes: ["123","32","232"], validateRecipes: {}, replaceRecipe: {_ in })
        super.init(rootView: budgetPlannerView)
    }

    override func viewDidLoad() {
        let budgetPlannerView = CoursesUBudgetPlannerView.init(
            toolbarTemplate: CoursesUBudgetPlannerToolbar(),
            recipeCardTemplate: CoursesUBudgetRecipeCard(),
            loadingCardTemplate: CoursesUBudgetRecipeCardLoading(),
            placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(),
            recipes: ["123","32","232"],
            validateRecipes: {
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(BasketPreviewViewController(), animated: true)
                }
            },
            replaceRecipe: { _ in
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(ReplaceMealViewController(), animated: true)
                }
            })
        self.rootView = budgetPlannerView
//        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Mon assistant Budget repas"
        navigationController?.navigationBar.backItem?.title = "     "
    }
    
}

//
//class MealPlannerViewController: UIHostingController<BudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>> {
//
//    required init?(coder aDecoder: NSCoder) {
//        let budgetPlannerView = BudgetPlannerView.init(toolbarTemplate: CoursesUBudgetPlannerToolbar(), footerTemplate: CoursesUBudgetPlannerFooter(), recipeCardTemplate: CoursesUBudgetRecipeCard(), loadingCardTemplate: CoursesUBudgetRecipeCardLoading(), placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(), recipes: ["123","32","232"], selectedRecipe: .constant("123"), showRecipe: {_ in}, validateRecipes: {}, replaceRecipe: {_ in})
//        super.init(coder: aDecoder, rootView: budgetPlannerView)
//    }
//
//    override init(rootView: BudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>) {
//        super.init(rootView: rootView)
//    }
//
//    public init() {
//        let budgetPlannerView = BudgetPlannerView.init(toolbarTemplate: CoursesUBudgetPlannerToolbar(), footerTemplate: CoursesUBudgetPlannerFooter(), recipeCardTemplate: CoursesUBudgetRecipeCard(), loadingCardTemplate: CoursesUBudgetRecipeCardLoading(), placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(), recipes: ["123","32","232"], selectedRecipe: .constant("123"), showRecipe: {_ in}, validateRecipes: {}, replaceRecipe: {_ in})
//        super.init(rootView: budgetPlannerView)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
