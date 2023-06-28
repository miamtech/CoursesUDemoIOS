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
//
//class ReplaceMealViewController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
//        CoursesUBudgetSearch,
//        CoursesURecipeCard,
//        CoursesUBudgetPlannerFooter>
//> {
//
//    required init?(coder aDecoder: NSCoder) {
//        let budgetRecipePicker = CoursesUBudgetPlannerRecipePickerView.init(searchTemplate: CoursesUBudgetSearch(), cardTemplate: CoursesURecipeCard(), stickyFooter: CoursesUBudgetPlannerFooter(), maxBudget: 35.0, onRecipeSelected: {_ in})
//        super.init(coder: aDecoder, rootView: budgetRecipePicker)
//    }
//
//    override init(rootView: CoursesUBudgetPlannerRecipePickerView<CoursesUBudgetSearch, CoursesURecipeCard, CoursesUBudgetPlannerFooter>) {
//        super.init(rootView: rootView)
//    }
//
//    public init() {
//        let budgetRecipePicker = CoursesUBudgetPlannerRecipePickerView.init(searchTemplate: CoursesUBudgetSearch(), cardTemplate: CoursesURecipeCard(), stickyFooter: CoursesUBudgetPlannerFooter(), maxBudget: 35.0, onRecipeSelected: {_ in})
//        super.init(rootView: budgetRecipePicker)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Ajouter une idée repas"
//        let budgetRecipePicker = CoursesUBudgetPlannerRecipePickerView.init(
//            searchTemplate: CoursesUBudgetSearch(),
//            cardTemplate: CoursesURecipeCard(),
//            stickyFooter: CoursesUBudgetPlannerFooter(),
//            maxBudget: 35.0,
//            onRecipeSelected: { _ in
//                DispatchQueue.main.async {
//                    self.navigationController?.popViewController(animated: true)
//                }
//            })
//        self.rootView = budgetRecipePicker
//    }
//}
class ReplaceMealViewController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
        CoursesUBudgetSearch,
        CoursesURecipeCard,
        CoursesUBudgetPlannerFooter>
> {

    var onRecipeSelectedAction: ((String) -> Void)?
    var isPoppingViewController = false

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ReplaceMealViewController.createRootView())
        setupRecipeSelectedAction()
    }

    override init(rootView: CoursesUBudgetPlannerRecipePickerView<CoursesUBudgetSearch, CoursesURecipeCard, CoursesUBudgetPlannerFooter>) {
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

    private static func createRootView(onRecipeSelected: ((String) -> Void)? = nil) -> CoursesUBudgetPlannerRecipePickerView<CoursesUBudgetSearch, CoursesURecipeCard, CoursesUBudgetPlannerFooter> {
        return CoursesUBudgetPlannerRecipePickerView(
            searchTemplate: CoursesUBudgetSearch(),
            cardTemplate: CoursesURecipeCard(),
            stickyFooter: CoursesUBudgetPlannerFooter(),
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
