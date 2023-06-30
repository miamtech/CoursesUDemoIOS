//
//  MealPlannerViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUxMiamFramework

class MealPlannerViewController: UIHostingController<CoursesUMealPlannerPlannerView<CoursesUMealPlannerToolbar, CoursesUMealPlannerFooter, MiamBudgetPlannerLoading, MiamBudgetPlannerEmpty, CoursesUMealPlannerRecipeCard, CoursesUMealPlannerRecipeCardLoading, CoursesUMealPlannerRecipePlaceholder>> {

    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

    override init(rootView: CoursesUMealPlannerPlannerView<CoursesUMealPlannerToolbar, CoursesUMealPlannerFooter, MiamBudgetPlannerLoading, MiamBudgetPlannerEmpty, CoursesUMealPlannerRecipeCard, CoursesUMealPlannerRecipeCardLoading, CoursesUMealPlannerRecipePlaceholder>) {
        super.init(rootView: rootView)
    }

    public init() {
        let mealPlannerView = CoursesUMealPlannerPlannerView.init(
            toolbarTemplate: CoursesUMealPlannerToolbar(),
            footerTemplate: CoursesUMealPlannerFooter(),
            loadingTemplate: MiamBudgetPlannerLoading(),
            emptyTemplate: MiamBudgetPlannerEmpty(),
            recipeCardTemplate: CoursesUMealPlannerRecipeCard(),
            loadingCardTemplate: CoursesUMealPlannerRecipeCardLoading(),
            placeholderCardTemplate: CoursesUMealPlannerRecipePlaceholder(),
            showRecipe: {_ in },
            validateRecipes: {},
            replaceRecipe: {_ in })
        super.init(rootView: mealPlannerView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let mealPlannerView = CoursesUMealPlannerPlannerView.init(
            toolbarTemplate: CoursesUMealPlannerToolbar(),
            footerTemplate: CoursesUMealPlannerFooter(),
            loadingTemplate: MiamBudgetPlannerLoading(),
            emptyTemplate: MiamBudgetPlannerEmpty(),
            recipeCardTemplate: CoursesUMealPlannerRecipeCard(),
            loadingCardTemplate: CoursesUMealPlannerRecipeCardLoading(),
            placeholderCardTemplate: CoursesUMealPlannerRecipePlaceholder(),
            showRecipe: {_ in },
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
        self.rootView = mealPlannerView
    }
}
//
//
//class MealPlannerViewController: UIHostingController<BudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, MiamBudgetPlannerLoading, MiamBudgetPlannerEmpty, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>> {
//
//    required init?(coder aDecoder: NSCoder) {
//        let budgetPlannerView = BudgetPlannerView.init(
//            toolbarTemplate: CoursesUBudgetPlannerToolbar(),
//            footerTemplate: CoursesUBudgetPlannerFooter(),
//            loadingTemplate: MiamBudgetPlannerLoading(),
//            emptyTemplate: MiamBudgetPlannerEmpty(),
//            recipeCardTemplate: CoursesUBudgetRecipeCard(),
//            loadingCardTemplate: CoursesUBudgetRecipeCardLoading(),
//            placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(),
//            selectedRecipe: .constant("123"),
//            showRecipe: {_ in},
//            validateRecipes: {},
//            replaceRecipe: {_ in})
//        super.init(coder: aDecoder, rootView: budgetPlannerView)
//    }
//
//    override init(rootView: BudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, MiamBudgetPlannerLoading, MiamBudgetPlannerEmpty, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>) {
//        super.init(rootView: rootView)
//    }
//
//    public init() {
//        let budgetPlannerView = BudgetPlannerView.init(
//            toolbarTemplate: CoursesUBudgetPlannerToolbar(),
//            footerTemplate: CoursesUBudgetPlannerFooter(),
//            loadingTemplate: MiamBudgetPlannerLoading(),
//            emptyTemplate: MiamBudgetPlannerEmpty(),
//            recipeCardTemplate: CoursesUBudgetRecipeCard(),
//            loadingCardTemplate: CoursesUBudgetRecipeCardLoading(),
//            placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(),
//            selectedRecipe: .constant("123"),
//            showRecipe: {_ in},
//            validateRecipes: {},
//            replaceRecipe: {_ in})
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
//}
