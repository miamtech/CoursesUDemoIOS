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


// This view Controller is implemented in a static manner because when I was popping the view off, it was always firing twice.
// My experience in UIKit is not great, so this is the solution I found that worked. You will probably have a better way
// to handle this
//class ReplaceMealViewController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
//        CoursesUMealPlannerSearch,
//        CoursesURecipeCard>
//> {
//
//    var onRecipeSelectedAction: ((String) -> Void)?
//    var isPoppingViewController = false
//    var onRecipeTappedAction: ((String) -> Void)?
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder, rootView: ReplaceMealViewController.createRootView(onRecipeTapped: onRecipeTappedAction))
//        setupRecipeSelectedAction()
//        setupOnRecipeTappedAction()
//    }
//
//    override init(rootView: CoursesUBudgetPlannerRecipePickerView<CoursesUMealPlannerSearch, CoursesURecipeCard>) {
//        super.init(rootView: ReplaceMealViewController.createRootView(onRecipeTapped: onRecipeTappedAction))
//        setupRecipeSelectedAction()
//        setupOnRecipeTappedAction()
//    }
//
//    public init() {
//        super.init(rootView: ReplaceMealViewController.createRootView(onRecipeTapped: onRecipeTappedAction))
//        setupRecipeSelectedAction()
//        setupOnRecipeTappedAction()
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Ajouter une idée repas"
//        self.rootView = ReplaceMealViewController.createRootView(onRecipeSelected: onRecipeSelectedAction, onRecipeTapped: onRecipeTappedAction)
//    }
//
//    private static func createRootView(onRecipeSelected: ((String) -> Void)? = nil, onRecipeTapped: ((String) -> Void)? = nil) -> CoursesUBudgetPlannerRecipePickerView<CoursesUMealPlannerSearch, CoursesURecipeCard> {
//        let maxBudget = UserDefaults.standard.value(forKey: "miam_budget_remaining") as? Double ?? 0.0
//        return CoursesUBudgetPlannerRecipePickerView(
//            searchTemplate: CoursesUMealPlannerSearch(),
//            cardTemplate: CoursesURecipeCard(),
//            onRecipeSelected: onRecipeSelected ?? { _ in },
//            onRecipeTapped: onRecipeTapped ?? { _ in }
//        )
//    }
//
//    private func setupRecipeSelectedAction() {
//        onRecipeSelectedAction = { _ in
//            DispatchQueue.main.async { [weak self] in
//                // because its popping 2 screens at a time
//                guard let self = self, !self.isPoppingViewController else { return }
//                self.isPoppingViewController = true
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
//    }
//
//    private func setupOnRecipeTappedAction() {
//        onRecipeTappedAction = { recipe in
//            UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
//            DispatchQueue.main.async { [weak self] in
//                self?.navigationController?.pushViewController(RecipeDetailsViewController(), animated: true)
//            }
//        }
//    }
//}

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
            onRecipeSelected: { _ in
                DispatchQueue.main.async { [weak self] in
                    // because its popping 2 screens at a time
//                    guard let self = self, !self.isPoppingViewController else { return }
//                    self.isPoppingViewController = true
                    self?.navigationController?.popViewController(animated: true)
                }
            },
            onRecipeTapped: { recipe in
                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.pushViewController(RecipeDetailsViewController(), animated: true)
                }
            })
    }
    // The hosting controller for your SwiftUI view
    private var hostingController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
        CoursesUMealPlannerSearch,
        CoursesURecipeCard>>!

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
