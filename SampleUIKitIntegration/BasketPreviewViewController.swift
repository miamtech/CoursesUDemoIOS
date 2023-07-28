//
//  BasketPreviewViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUxMiamFramework
//
class BasketPreviewViewController: UIHostingController<CoursesUMealPlannerBasketPreviewView<
CoursesUMealPlannerBasketPreviewLoading,
    CoursesUMealPlannerBasketPreviewRecipeOverview,
    CoursesUMealPlannerRecipeCardLoading,
    CoursesUMealPlannerBasketPreviewProduct,
    CoursesUMealPlannerBasketPreviewSectionTitle,
    CoursesUMealPlannerBasketPreviewSectionProduct>
> {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(rootView: CoursesUMealPlannerBasketPreviewView<
                  CoursesUMealPlannerBasketPreviewLoading,
                  CoursesUMealPlannerBasketPreviewRecipeOverview,
                  CoursesUMealPlannerRecipeCardLoading,
                  CoursesUMealPlannerBasketPreviewProduct,
                  CoursesUMealPlannerBasketPreviewSectionTitle,
                  CoursesUMealPlannerBasketPreviewSectionProduct>) {
        super.init(rootView: rootView)
    }

    public init() {
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            recipeLoadingTemplate: CoursesUMealPlannerRecipeCardLoading(),
            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
            validateRecipes: {},
            replaceProduct: {_ in},
            onRecipeTapped: {_ in}
        )
        super.init(rootView: budgetPreview)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            recipeLoadingTemplate: CoursesUMealPlannerRecipeCardLoading(),
            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
            validateRecipes: {
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(RecapPurchaseViewController(), animated: true)
                }
            },
            replaceProduct: { recipe in
                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(ItemSelectorViewController(), animated: true)
                }
            },
            onRecipeTapped: { recipe in
                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(RecipeDetailsViewController(), animated: true)
                }
            }
        )
        self.rootView = budgetPreview
        // Do any additional setup after loading the view.


    }
}
////

//class BasketPreviewViewController: CustomUIHostingController<MealPlannerBasketPreviewView<
//CoursesUMealPlannerBasketPreviewLoading,
//    CoursesUMealPlannerBasketPreviewRecipeOverview,
//    CoursesUMealPlannerBasketPreviewProduct,
//    MiamMealPlannerBasketPreviewFooter,
//    CoursesUMealPlannerBasketPreviewSectionTitle,
//    CoursesUMealPlannerBasketPreviewSectionProduct>
//> {
//
//    required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//        }
//
//    public init() {
//        let budgetPreview = MealPlannerBasketPreviewView.init(
//            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
//            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
//            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
//            footerTemplate: MiamMealPlannerBasketPreviewFooter(),
//            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
//            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
//            continueShopping: {},
//            showBasket: {}
////            validateRecipes: {}
//        )
//        super.init(rootView: budgetPreview)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Mon assistant Budget repas"
//        let budgetPreview = MealPlannerBasketPreviewView.init(
//            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
//            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
//            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
//            footerTemplate: MiamMealPlannerBasketPreviewFooter(),
//            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
//            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
//            continueShopping: {},
//            showBasket: {}
//            //            validateRecipes: {
//            //                DispatchQueue.main.async {
//            //                    self.navigationController?.pushViewController(RecapPurchaseViewController(), animated: true)
//            //                }
//            //            }
//        )
//        self.rootView = budgetPreview
//        // Do any additional setup after loading the view.
//        // Set the background color
//        self.view.backgroundColor = UIColor(red: 191.0 / 255, green: 221.0 / 255, blue: 232.0/255, alpha: 1.0)
//    }
//
//}
