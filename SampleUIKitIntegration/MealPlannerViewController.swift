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

class MealPlannerViewController: UIHostingController<CoursesUBudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, MiamBudgetPlannerLoading, MiamBudgetPlannerEmpty, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>> {

    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

    override init(rootView: CoursesUBudgetPlannerView<CoursesUBudgetPlannerToolbar, CoursesUBudgetPlannerFooter, MiamBudgetPlannerLoading, MiamBudgetPlannerEmpty, CoursesUBudgetRecipeCard, CoursesUBudgetRecipeCardLoading, CoursesUBudgetRecipePlaceholder>) {
        super.init(rootView: rootView)
    }

    public init() {
        let budgetPlannerView = CoursesUBudgetPlannerView.init(
            toolbarTemplate: CoursesUBudgetPlannerToolbar(),
            footerTemplate: CoursesUBudgetPlannerFooter(),
            loadingTemplate: MiamBudgetPlannerLoading(),
            emptyTemplate: MiamBudgetPlannerEmpty(),
            recipeCardTemplate: CoursesUBudgetRecipeCard(),
            loadingCardTemplate: CoursesUBudgetRecipeCardLoading(),
            placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(),
            recipes: ["123","32","232"],
            showRecipe: {_ in },
            validateRecipes: {},
            replaceRecipe: {_ in })
        super.init(rootView: budgetPlannerView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let budgetPlannerView = CoursesUBudgetPlannerView.init(
            toolbarTemplate: CoursesUBudgetPlannerToolbar(),
            footerTemplate: CoursesUBudgetPlannerFooter(),
            loadingTemplate: MiamBudgetPlannerLoading(),
            emptyTemplate: MiamBudgetPlannerEmpty(),
            recipeCardTemplate: CoursesUBudgetRecipeCard(),
            loadingCardTemplate: CoursesUBudgetRecipeCardLoading(),
            placeholderCardTemplate: CoursesUBudgetRecipePlaceholder(),
            recipes: ["123","32","232"],
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
        self.rootView = budgetPlannerView
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
//            recipes: ["123","32","232"],
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
//            recipes: ["123","32","232"],
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
