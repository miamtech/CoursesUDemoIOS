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
            basketProduct: CoursesUMealPlannerBasketPreviewProduct())
        super.init(coder: aDecoder, rootView: budgetPreview)
    }
    
    override init(rootView: CoursesUMealPlannerBasketPreviewView<CoursesUMealPlannerBasketPreviewRecipeOverview, CoursesUMealPlannerBasketPreviewProduct>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
            recipeOverview: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            basketProduct: CoursesUMealPlannerBasketPreviewProduct())
        super.init(rootView: budgetPreview)
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
