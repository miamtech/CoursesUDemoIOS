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

class MealPlannerViewController: UIViewController {
    deinit {
        print("deinit: MealPlannerViewController is being deallocated")
    }
    // Your SwiftUI View
    var swiftUIView: CoursesUMealPlannerPlannerView<
            CoursesUMealPlannerToolbar,
            CoursesUMealPlannerFooter,
            MiamBudgetPlannerLoading,
            MiamBudgetPlannerEmpty,
            CoursesUMealPlannerRecipeCard,
            CoursesUMealPlannerRecipeCardLoading,
            CoursesUMealPlannerRecipePlaceholder
    > {
        return CoursesUMealPlannerPlannerView(
            toolbarTemplate: CoursesUMealPlannerToolbar(),
            footerTemplate: CoursesUMealPlannerFooter(),
            loadingTemplate: MiamBudgetPlannerLoading(),
            emptyTemplate: MiamBudgetPlannerEmpty(),
            recipeCardTemplate: CoursesUMealPlannerRecipeCard(),
            loadingCardTemplate: CoursesUMealPlannerRecipeCardLoading(),
            placeholderCardTemplate: CoursesUMealPlannerRecipePlaceholder(),
            showRecipe: { [weak self] recipe in
                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
                DispatchQueue.main.async {
                    guard let strongSelf = self else { return }
                    strongSelf.navigationController?.pushViewController(RecipeDetailsViewController(), animated: true)
                }
            },
            validateRecipes: { [weak self] in
                DispatchQueue.main.async {
                    guard let strongSelf = self else { return }
                    strongSelf.navigationController?.pushViewController(BasketPreviewViewController(), animated: true)
                }
            },
            replaceRecipe: { [weak self] _ in
                DispatchQueue.main.async {
                    guard let strongSelf = self else { return }
                    strongSelf.navigationController?.pushViewController(ReplaceMealViewController(), animated: true)
                }
            })
    }
    
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CoursesUMealPlannerPlannerView<
        CoursesUMealPlannerToolbar,
        CoursesUMealPlannerFooter,
        MiamBudgetPlannerLoading,
        MiamBudgetPlannerEmpty,
        CoursesUMealPlannerRecipeCard,
        CoursesUMealPlannerRecipeCardLoading,
        CoursesUMealPlannerRecipePlaceholder
>>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
        // Initialize the hosting controller with your SwiftUI view
        hostingController = UIHostingController(rootView: swiftUIView)
        // Add as a child of the current view controller
        addChild(hostingController)
        // Add the SwiftUI view to the view controller view hierarchy
        view.addSubview(hostingController.view)
        // Setup constraints to dictate the size and positioning of the SwiftUI view
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Complete the addition of the child view controller
        hostingController.didMove(toParent: self)
    }
}
