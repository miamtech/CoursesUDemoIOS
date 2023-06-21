//
//  ReplaceMealViewController.swift
//  SampleUIKitIntegration
//
//  Created by didi on 6/21/23.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUIOSTemplate

class ReplaceMealViewController: UIHostingController<CoursesUBudgetPlannerRecipePickerView<
        CoursesUBudgetSearch,
        CoursesURecipeCard,
        CoursesUBudgetPlannerFooter>
> {
    
    required init?(coder aDecoder: NSCoder) {
        let budgetRecipePicker = CoursesUBudgetPlannerRecipePickerView.init(searchTemplate: CoursesUBudgetSearch(), cardTemplate: CoursesURecipeCard(), stickyFooter: CoursesUBudgetPlannerFooter(), onRecipeSelected: {_ in})
        super.init(coder: aDecoder, rootView: budgetRecipePicker)
    }
    
    override init(rootView: CoursesUBudgetPlannerRecipePickerView<CoursesUBudgetSearch, CoursesURecipeCard, CoursesUBudgetPlannerFooter>) {
        super.init(rootView: rootView)
    }
    
    public init() {
        let budgetRecipePicker = CoursesUBudgetPlannerRecipePickerView.init(searchTemplate: CoursesUBudgetSearch(), cardTemplate: CoursesURecipeCard(), stickyFooter: CoursesUBudgetPlannerFooter(), onRecipeSelected: {_ in})
        super.init(rootView: budgetRecipePicker)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ajouter une idée repas"
        let budgetRecipePicker = CoursesUBudgetPlannerRecipePickerView.init(
            searchTemplate: CoursesUBudgetSearch(),
            cardTemplate: CoursesURecipeCard(),
            stickyFooter: CoursesUBudgetPlannerFooter(),
            onRecipeSelected: { _ in
                // this should add Recipe back to VM?
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            })
        self.rootView = budgetRecipePicker
    }
}
