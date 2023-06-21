//
//  BasketPreviewViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUIOSTemplate

class BasketPreviewViewController: UIHostingController<CoursesUMealPlannerBasketPreviewView<
    CoursesUMealPlannerBasketPreviewRecipeOverview,
    CoursesUMealPlannerBasketPreviewProduct>
> {
    
    required init?(coder aDecoder: NSCoder) {
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct(), validateRecipes: {})
        super.init(coder: aDecoder, rootView: budgetPreview)
    }
    
    override init(rootView: CoursesUMealPlannerBasketPreviewView<CoursesUMealPlannerBasketPreviewRecipeOverview, CoursesUMealPlannerBasketPreviewProduct>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct() ,validateRecipes: {})
        super.init(rootView: budgetPreview)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct(),
            validateRecipes: {
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(RecapPurchaseViewController(), animated: true)
                }
            })
        self.rootView = budgetPreview
        // Do any additional setup after loading the view.
    }
}
