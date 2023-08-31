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
//class BasketPreviewViewController: UIHostingController<CoursesUMealPlannerBasketPreviewView<
//CoursesUMealPlannerBasketPreviewLoading,
//    CoursesUMealPlannerBasketPreviewRecipeOverview,
//    CoursesUMealPlannerRecipeCardLoading,
//    CoursesUMealPlannerBasketPreviewProduct,
//    CoursesUMealPlannerBasketPreviewSectionTitle,
//    CoursesUMealPlannerBasketPreviewSectionProduct>
//> {
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
//    override init(rootView: CoursesUMealPlannerBasketPreviewView<
//                  CoursesUMealPlannerBasketPreviewLoading,
//                  CoursesUMealPlannerBasketPreviewRecipeOverview,
//                  CoursesUMealPlannerRecipeCardLoading,
//                  CoursesUMealPlannerBasketPreviewProduct,
//                  CoursesUMealPlannerBasketPreviewSectionTitle,
//                  CoursesUMealPlannerBasketPreviewSectionProduct>) {
//        super.init(rootView: rootView)
//    }
//
//    public init() {
//        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
//            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
//            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
//            recipeLoadingTemplate: CoursesUMealPlannerRecipeCardLoading(),
//            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
//            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
//            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
//            validateRecipes: {},
//            replaceProduct: {_ in},
//            onRecipeTapped: {_ in}
//        )
//        super.init(rootView: budgetPreview)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Mon assistant Budget repas"
//        let budgetPreview = CoursesUMealPlannerBasketPreviewView.init(
//            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
//            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
//            recipeLoadingTemplate: CoursesUMealPlannerRecipeCardLoading(),
//            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
//            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
//            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
//            validateRecipes: {
//                DispatchQueue.main.async {
//                    self.navigationController?.pushViewController(RecapPurchaseViewController(), animated: true)
//                }
//            },
//            replaceProduct: { recipe in
//                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
//                DispatchQueue.main.async {
//                    self.navigationController?.pushViewController(ItemSelectorViewController(), animated: true)
//                }
//            },
//            onRecipeTapped: { recipe in
//                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
//                DispatchQueue.main.async {
//                    self.navigationController?.pushViewController(RecipeDetailsViewController(), animated: true)
//                }
//            }
//        )
//        self.rootView = budgetPreview
//        // Do any additional setup after loading the view.
//
//
//    }
//}

class BasketPreviewViewController: UIViewController {
    
    deinit {
        print("deinit: BasketPreviewViewController is being deallocated")
    }
    // Your SwiftUI View
    var swiftUIView: CoursesUMealPlannerBasketPreviewView<
        CoursesUMealPlannerBasketPreviewLoading,
        CoursesUMealPlannerBasketPreviewRecipeOverview,
        CoursesUMealPlannerRecipeCardLoading,
        CoursesUMealPlannerBasketPreviewProduct,
        CoursesUMealPlannerBasketPreviewSectionTitle,
        CoursesUMealPlannerBasketPreviewSectionProduct
    > {
        return CoursesUMealPlannerBasketPreviewView(
            loadingTemplate: CoursesUMealPlannerBasketPreviewLoading(),
            recipeOverviewTemplate: CoursesUMealPlannerBasketPreviewRecipeOverview(),
            recipeLoadingTemplate: CoursesUMealPlannerRecipeCardLoading(),
            productTemplate: CoursesUMealPlannerBasketPreviewProduct(),
            sectionTitleTemplate: CoursesUMealPlannerBasketPreviewSectionTitle(),
            sectionProductTemplate: CoursesUMealPlannerBasketPreviewSectionProduct(),
            validateRecipes: {
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.pushViewController(RecapPurchaseViewController(), animated: true)
                }
            },
            replaceProduct: { recipe in
                UserDefaults.standard.set(recipe, forKey: "miam_mealplanner_recipeId")
                DispatchQueue.main.async { [weak self] in
                    self?.navigationController?.pushViewController(ItemSelectorViewController(), animated: true)
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
    private var hostingController: UIHostingController<CoursesUMealPlannerBasketPreviewView<
        CoursesUMealPlannerBasketPreviewLoading,
            CoursesUMealPlannerBasketPreviewRecipeOverview,
            CoursesUMealPlannerRecipeCardLoading,
            CoursesUMealPlannerBasketPreviewProduct,
            CoursesUMealPlannerBasketPreviewSectionTitle,
            CoursesUMealPlannerBasketPreviewSectionProduct>>!

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

