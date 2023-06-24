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
CoursesUMealPlannerBasketPreviewLoading,
    CoursesUMealPlannerBasketPreviewRecipeOverview,
    CoursesUMealPlannerBasketPreviewProduct,
    CoursesUMealPlannerBasketPreviewSectionTitle,
    CoursesUMealPlannerBasketPreviewSectionProduct>
> {
    
    required init?(coder aDecoder: NSCoder) {
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct(),
            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(), validateRecipes: {})
        super.init(coder: aDecoder, rootView: budgetPreview)
    }
    
    override init(rootView: CoursesUMealPlannerBasketPreviewView<
                  CoursesUMealPlannerBasketPreviewLoading,
                  CoursesUMealPlannerBasketPreviewRecipeOverview,
                  CoursesUMealPlannerBasketPreviewProduct,
                  CoursesUMealPlannerBasketPreviewSectionTitle,
                  CoursesUMealPlannerBasketPreviewSectionProduct>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct(),
            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),validateRecipes: {})
        super.init(rootView: budgetPreview)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct(),
            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
            validateRecipes: {
                DispatchQueue.main.async {
                    self.navigationController?.pushViewController(RecapPurchaseViewController(), animated: true)
                }
            })
        self.rootView = budgetPreview
        // Do any additional setup after loading the view.
    }
}
