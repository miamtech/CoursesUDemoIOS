//
//  ReplaceMealViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
//import MiamIOSFramework
import CoursesUIOSTemplate

class ReplaceMealViewController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
        CoursesUMealPlannerSearch,
        CoursesURecipeCard,
        CoursesUMealPlannerFooter>
> {

    var onRecipeSelectedAction: ((String) -> Void)?
    var isPoppingViewController = false

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ReplaceMealViewController.createRootView())
        setupRecipeSelectedAction()
    }

    override init(rootView: CoursesUBudgetPlannerRecipePickerView<CoursesUMealPlannerSearch, CoursesURecipeCard, CoursesUMealPlannerFooter>) {
        super.init(rootView: ReplaceMealViewController.createRootView())
        setupRecipeSelectedAction()
    }

    public init() {
        super.init(rootView: ReplaceMealViewController.createRootView())
        setupRecipeSelectedAction()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ajouter une idée repas"
        self.rootView = ReplaceMealViewController.createRootView(onRecipeSelected: onRecipeSelectedAction)
    }

    private static func createRootView(onRecipeSelected: ((String) -> Void)? = nil) -> CoursesUBudgetPlannerRecipePickerView<CoursesUMealPlannerSearch, CoursesURecipeCard, CoursesUMealPlannerFooter> {
        return CoursesUBudgetPlannerRecipePickerView(
            searchTemplate: CoursesUMealPlannerSearch(),
            cardTemplate: CoursesURecipeCard(),
            stickyFooter: CoursesUMealPlannerFooter(),
            maxBudget: 35.0,
            onRecipeSelected: onRecipeSelected ?? { _ in }
        )
    }

    private func setupRecipeSelectedAction() {
        onRecipeSelectedAction = { _ in
            DispatchQueue.main.async { [weak self] in
                // because its popping 2 screens at a time 
                guard let self = self, !self.isPoppingViewController else { return }
                                self.isPoppingViewController = true
                                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
