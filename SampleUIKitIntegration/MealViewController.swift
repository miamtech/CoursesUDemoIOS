//
//  MealViewController.swift
//  SampleUIKitIntegration
//
//  Created by Vincent Kergonna on 12/07/2022.
//

import UIKit
import SwiftUI
import MiamIOSFramework
import CoursesUIOSTemplate

class MealViewController: UIHostingController<BudgetFormView<CoursesUBudgetForm>> {
    // Initialize our controller with RecipeCardView as a root view and show
    // recipe 1.
    required init?(coder aDecoder: NSCoder) {
        let budgetForm = BudgetFormView.init(
            budgetForm: CoursesUBudgetForm(maxOfMeals: .constant(4)),
            budgetInfos: BudgetInfos(moneyBudget: 0.0, numberOfGuests: 0, numberOfMeals: 0),
            onBudgetValidated: {_ in print("this will nav")}
        )
        super.init(coder: aDecoder, rootView: budgetForm)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 0/255, green: 85/255, blue: 98/255, alpha: 1.0)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.standardAppearance = appearance
          navigationController?.navigationBar.compactAppearance = appearance
          navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.topItem?.title = "Mon assistant Budget repas"
        navigationController?.navigationBar.backItem?.title = "     "
    }
    
    override func viewDidLoad() {
        let budgetForm = BudgetFormView.init(
            budgetForm: CoursesUBudgetForm(maxOfMeals: .constant(4)),
            budgetInfos: BudgetInfos(moneyBudget: 0.0, numberOfGuests: 0, numberOfMeals: 0),
            onBudgetValidated: {_ in DispatchQueue.main.async {
                self.navigationController?.pushViewController(MealPlannerViewController(), animated: true)}
            }
        )
        self.rootView = budgetForm
    }
    
    
}
