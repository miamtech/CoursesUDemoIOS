//
//  RecipeDetailsViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 7/6/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUxMiamFramework

class RecipeDetailsViewController: UIHostingController<
    RecipeDetailsViewTemplate<
        CoursesURecipeDetailsHeaderView,
        CoursesURecipeDetailsIngredientsView,
        CoursesURecipeDetailsStepsView,
        CoursesURecipeDetailsFooterView>
    > {

        required init?(coder aDecoder: NSCoder) {
                 super.init(coder: aDecoder)
             }

             override init(rootView: RecipeDetailsViewTemplate<
                           CoursesURecipeDetailsHeaderView,
                           CoursesURecipeDetailsIngredientsView,
                           CoursesURecipeDetailsStepsView,
                           CoursesURecipeDetailsFooterView>
                       ) {
                 super.init(rootView: rootView)
             }

             public init() {
                 let itemSelector = RecipeDetailsViewTemplate.init(
                    headerContent: CoursesURecipeDetailsHeaderView(),
                    ingredientsContent: CoursesURecipeDetailsIngredientsView(),
                    stepsContent: CoursesURecipeDetailsStepsView(),
                    footerContent: CoursesURecipeDetailsFooterView(),
                    recipeId: "",
                    sponsorDetailsTapped: {_ in},
                    close: {})
                 super.init(rootView: itemSelector)
             }

             override func viewDidLoad() {
                 let recipeId = UserDefaults.standard.value(forKey: "miam_mealplanner_recipeId") as? String ?? ""
                 self.title = "Catalogue"
                 super.viewDidLoad()
                 let itemSelector = RecipeDetailsViewTemplate.init(
                    headerContent: CoursesURecipeDetailsHeaderView(),
                    ingredientsContent: CoursesURecipeDetailsIngredientsView(),
                    stepsContent: CoursesURecipeDetailsStepsView(),
                    footerContent: CoursesURecipeDetailsFooterView(),
                    recipeId: recipeId,
                    sponsorDetailsTapped: {_ in},
                    close: {
                         self.navigationController?.popViewController(animated: true)
                 })
                 self.rootView = itemSelector
                 // Do any additional setup after loading the view.
             }
         }
