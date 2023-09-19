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
        CoursesURecipeDetailsFooterView>>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Idée repas"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Retour", style: .plain, target: nil, action: nil)
        hostingController = UIHostingController(rootView: swiftUIView)
        guard let hostingController = hostingController, let hcView = hostingController.view
        else { return }
        // Since hostingController is optional, using guard to safely unwrap its view
        hcView.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingController)
        view.addSubview(hcView)
        NSLayoutConstraint.activate([
            hcView.topAnchor.constraint(equalTo: view.topAnchor),
            hcView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hcView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hcView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        hostingController.didMove(toParent: self)
    }
}
