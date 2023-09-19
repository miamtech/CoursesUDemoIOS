//
//  ReplaceMealViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
//import MiamIOSFramework
import CoursesUxMiamFramework

class ReplaceMealViewController: UIViewController {
    deinit {
        print("deinit: ReplaceMealViewController is being deallocated")
    }
    // Your SwiftUI View
    var swiftUIView: CoursesUBudgetPlannerRecipePickerView<
        CoursesUMealPlannerSearch,
        CoursesURecipeCard> {
        return CoursesUBudgetPlannerRecipePickerView(
            searchTemplate: CoursesUMealPlannerSearch(),
            cardTemplate: CoursesURecipeCard(),
            onRecipeSelected: { [weak self] _ in
                DispatchQueue.main.async {
                    self?.navigationController?.popViewController(animated: true)
                }
            },
            onRecipeTapped: { [weak self] recipe in
                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
                DispatchQueue.main.async {
                    self?.navigationController?.pushViewController(RecipeDetailsViewController(), animated: true)
                }
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
        CoursesUMealPlannerSearch,
        CoursesURecipeCard>>?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon assistant Budget repas"
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
