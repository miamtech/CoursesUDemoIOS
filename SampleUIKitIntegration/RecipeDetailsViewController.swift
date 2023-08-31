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

class RecipeDetailsViewController: UIViewController {
    deinit {
        print("deinit: RecipeDetailsViewController is being deallocated")
    }
    let recipeId = UserDefaults.standard.value(forKey: "miam_mealplanner_recipeId") as? String ?? ""
    // Your SwiftUI View
    var swiftUIView: RecipeDetailsViewTemplate<
        CoursesURecipeDetailsHeaderView,
        CoursesURecipeDetailsIngredientsView,
        CoursesURecipeDetailsStepsView,
        CoursesURecipeDetailsFooterView> {
        return RecipeDetailsViewTemplate(
            headerContent: CoursesURecipeDetailsHeaderView(),
            ingredientsContent: CoursesURecipeDetailsIngredientsView(),
            stepsContent: CoursesURecipeDetailsStepsView(),
            footerContent: CoursesURecipeDetailsFooterView(),
            recipeId: recipeId,
            isForMealPlanner: true,
            sponsorDetailsTapped: {_ in},
            close: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
         })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<RecipeDetailsViewTemplate<
        CoursesURecipeDetailsHeaderView,
        CoursesURecipeDetailsIngredientsView,
        CoursesURecipeDetailsStepsView,
        CoursesURecipeDetailsFooterView>>!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Idée repas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
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
